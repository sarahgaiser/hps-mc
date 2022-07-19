#!/usr/bin/scl enable devtoolset-8 -- /bin/bash
source /sdf/group/hps/users/sgaiser/src/hps-mc/install/bin/hps-mc-env.sh
mkdir -p /scratch/sgaiser/beam/9801
cd /scratch/sgaiser/beam/9801
/bin/python3 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/hpsmc/job.py run -o /scratch/sgaiser/logs/job.9801.out -e /scratch/sgaiser/logs/job.9801.err -l /scratch/sgaiser/logs/job.9801.log -d /scratch/sgaiser/beam/9801 -c /sdf/group/hps/users/sgaiser/src/hps-mc/examples/beam_gen/.hpsmc -i 9801 /sdf/group/hps/users/sgaiser/src/hps-mc/install/lib/python/jobs/beam_gen_job.py /sdf/group/hps/users/sgaiser/src/hps-mc/examples/beam_gen/jobs.json
