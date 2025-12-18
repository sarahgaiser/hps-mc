#hps-mc-job-template -i ap ap80_file_list.txt 4 -j 1 -m 500 -a vars.json job.json.tmpl jobs_ap80.json
#hps-mc-job-template -i tritrig tritrig_files_v8_14272.txt 8 -i pulser pulser_files.txt 1 -j 1 -m 200 -a vars.json job_evio.json.tmpl jobs_14272.json
hps-mc-job-template -j 1 -r 750 -a vars.json job.json.tmpl jobs_ap180.json
