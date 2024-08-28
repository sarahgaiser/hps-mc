#!/bin/bash

counter=1
while [ $counter -le 50 ]
do
	echo $counter
	cp /fs/ddn/sdf/scratch/s/sgaiser/tritrig_beam/recon/$counter/signal_pulser_readout_recon.slcio /fs/ddn/sdf/group/hps/mc/tritrig_beam/3pt74/double_bkg/20um120nA/HPS_Run2021Pass1_v4newBot/reconKF/tritrig_pulser_recon_3pt74_double_bkg_20um120nA_HPS_Run2021Pass1_v4newBot_$counter.slcio
	cp /fs/ddn/sdf/scratch/s/sgaiser/tritrig_beam/recon/$counter/signal_pulser_readout_recon.root /fs/ddn/sdf/group/hps/mc/tritrig_beam/3pt74/double_bkg/20um120nA/HPS_Run2021Pass1_v4newBot/reconKF/root/tritrig_pulser_recon_3pt74_double_bkg_20um120nA_HPS_Run2021Pass1_v4newBot_$counter.root
	cp /fs/ddn/sdf/scratch/s/sgaiser/tritrig_beam/recon/$counter/signal_pulser_readout_recon_ana.root /fs/ddn/sdf/group/hps/mc/tritrig_beam/3pt74/double_bkg/20um120nA/HPS_Run2021Pass1_v4newBot/ana/tritrig_pulser_ana_3pt74_double_bkg_20um120nA_HPS_Run2021Pass1_v4newBot_$counter.root
	((counter++))
done
