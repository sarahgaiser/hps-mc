#!/bin/bash
for num in {1..10}; do
	stdhep_print_stdhep /sdf/data/hps/physics2021/mc/gen/tritrig/pass01/tritrig_3pt74_mom_rot_$num.stdhep > /sdf/home/s/sgaiser/src/hps-mc/prod/slac/mcprod_2021/tritrig/converted_stdhep/tritrig_3pt74_mom_rot_$num.txt
done
