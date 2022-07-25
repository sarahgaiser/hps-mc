#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
mkdir -p /scratch/sgaiser/tritrig/2002
cd /scratch/sgaiser/tritrig/2002
/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/sgaiser/tritrig/logs/job.2002.out -e /scratch/sgaiser/tritrig/logs/job.2002.err -l /scratch/sgaiser/tritrig/logs/job.2002.log -d /scratch/sgaiser/tritrig/2002 -c /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/.hpsmc -i 2002 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/tritrig_gen_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/examples/tritrig_gen/jobs.json
