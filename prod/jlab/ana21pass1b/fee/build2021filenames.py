import ROOT as r
import os
import glob

myT = r.TTree("myT","myT")
myT.ReadFile("hps2021goldRuns.csv")
nPartsTot = 0

outF = open('run2021pass1bfee.txt','w')

for run in myT:
    nfiles = run.evio_files_count
    RN = run.number
    fullpath = f'/mss/hallb/hps/physrun2021/data/hps_0{RN}/hps_0{RN}.evio.00000'
    pin = ""
    if not os.path.isfile(fullpath): 
        pin = "pin"
        fullpath = f'/mss/hallb/hps/physrun2021/data/hpspin_0{RN}/hpspin_0{RN}.evio.00000'
    print("")
    print("Run number: ", RN)
    print("N partitions: ", nfiles)
    passList = glob.glob(f'/mss/hallb/hps/physrun2021/production/evio-skims/fee/0{RN}/hps_fee_*')
    print(passList)
    print(len(passList))
    nPartsTot += len(passList)
    for fileLine in passList:
        outF.write(fileLine+'\n')
        pass
    pass

outF.close()
print("Total parts in pass: ", nPartsTot)