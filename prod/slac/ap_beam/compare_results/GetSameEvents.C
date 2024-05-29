#include "/sdf/home/s/sgaiser/src/hpstr/event/include/MCParticle.h"

// ROOT
#include "TFile.h"
#include "TTree.h"
#include "TRefArray.h"
#include "TBranch.h"
#include "TVector3.h"
#include "TLorentzVector.h"

#include <iostream>
#include <fstream>

void GetSameEvents() {
	std::cout << "Beginning to read data" << std::endl;
	std::unique_ptr<TFile> pulserFile(TFile::Open("/fs/ddn/sdf/group/hps/users/sgaiser/data/MC_pulser/compare_results/input/ap_pulser_readout_recon_4.root"));
	auto pulserTree = pulserFile->Get<TTree>("HPS_Event");
	
	std::unique_ptr<TFile> fullMCFile(TFile::Open("/fs/ddn/sdf/group/hps/users/sgaiser/data/MC_pulser/compare_results/input/ap_beam_readout_recon_3pt74_20pt0umW_1_678910.root"));
        auto fullMCTree = fullMCFile->Get<TTree>("HPS_Event");

	std::unique_ptr<TFile> sameEventsPulserFile(TFile::Open("/fs/ddn/sdf/group/hps/users/sgaiser/data/MC_pulser/compare_results/output/same_events_ap_pulser_readout_recon_4.root", "recreate"));
	auto sameEventsPulserTree = new TTree("HPS_Event", "HPS_Event");
 //	pulserTree->AddClone(sameEventsPulserTree);
	sameEventsPulserTree = pulserTree->CloneTree(0);
	//sameEventsPulserTree->SetDirectory(sameEventsPulserFile);

	vector<MCParticle*> *mcparts_pulser = nullptr;
	pulserTree->SetBranchAddress("MCParticle", &mcparts_pulser);

	vector<MCParticle*> *mcparts_fullMC = nullptr;
        fullMCTree->SetBranchAddress("MCParticle", &mcparts_fullMC);

	int count = 0;
	std::cout << count << std::endl;

        
	ofstream fullMC_same_events;
  	fullMC_same_events.open ("/fs/ddn/sdf/group/hps/users/sgaiser/data/MC_pulser/compare_results/output/txt/fullMC_same_events_4.txt");
  	fullMC_same_events << "entry;mcpart\n";

	ofstream pulser_same_events;
        pulser_same_events.open ("/fs/ddn/sdf/group/hps/users/sgaiser/data/MC_pulser/compare_results/output/txt/pulser_same_events_4.txt");
        pulser_same_events << "entry;mcpart\n";

	int stop_idx = 0;

	for (int iEntry = 0; fullMCTree->LoadTree(iEntry) >= 0; ++iEntry) {	       
	//for (int iEntry = 0; iEntry < 100; ++iEntry) {
                // Load the data for the given tree entry
		std::cout << "MC entry: " << iEntry << std::endl;
                fullMCTree->GetEntry(iEntry);
		Double_t px = 0;
		Int_t idx = 0;
                for (int i = 0; i < mcparts_fullMC->size(); i++){
			if (mcparts_fullMC->at(i)->getPDG() == 622){
				px = mcparts_fullMC->at(i)->getMomentum()[0];
				idx = i;
			}
		}
		Int_t same_jEntry = -1;
		for (int jEntry = stop_idx; pulserTree->LoadTree(jEntry) >= 0; ++jEntry) {
		//for (int jEntry = stop_idx; jEntry < 100; ++jEntry) {
			// Load the data for the given tree entry
                	pulserTree->GetEntry(jEntry);
			for (int j = 0; j < mcparts_pulser->size(); j++){
                        	if (mcparts_pulser->at(j)->getPDG() == 622){
                                	if (mcparts_pulser->at(j)->getMomentum()[0] == px) {
						if (jEntry > stop_idx + 200) {
							std::cout << "too far away:" << jEntry << " vs previous " << stop_idx << std::endl;
							break;
						}
						same_jEntry = jEntry;
						stop_idx = jEntry;
						count++;
						fullMC_same_events << iEntry << ";" << idx << std::endl;
						pulser_same_events << jEntry << ";" << j << std::endl;
						break;
					}
                        	}
                	}
			if (same_jEntry > -1) break;
                }
		if (same_jEntry > -1) {
			pulserTree->GetEntry(same_jEntry);
			sameEventsPulserTree->Fill();
		} 

	}
	fullMC_same_events.close();
	pulser_same_events.close();
	std::cout << count << std::endl;

	sameEventsPulserFile->cd();
	sameEventsPulserTree->Write();
	sameEventsPulserFile->Close();
}
