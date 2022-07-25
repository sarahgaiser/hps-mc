#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
mkdir -p /scratch/sgaiser/tritrig/1001
cd /scratch/sgaiser/tritrig/1001
/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/sgaiser/tritrig/logs/job.1001.out -e /scratch/sgaiser/tritrig/logs/job.1001.err -l /scratch/sgaiser/tritrig/logs/job.1001.log -d /scratch/sgaiser/tritrig/1001 -c /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/.hpsmc -i 1001 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/tritrig_gen_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/jobs.json
