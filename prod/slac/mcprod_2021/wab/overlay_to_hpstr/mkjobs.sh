#hps-mc-job-template -j 1 -r 1000 -a vars.json job_hpstr.json.tmpl jobs_hpstr.json
hps-mc-job-template -j 1 -r 1000 -a vars.json job.json.tmpl jobs_14272.json
#hps-mc-job-template -i tritrig tritrig_files_v8_14272.txt 8 -i pulser pulser_files.txt 1 -j 1 -m 200 -a vars.json job_evio.json.tmpl jobs_14272.json
#hps-mc-job-template -j 1 -r 1000 -a vars.json job_recon.json.tmpl jobs_recon.json
