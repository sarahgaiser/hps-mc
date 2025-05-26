#!/bin/bash

output_file="cross_sections_rad.txt"
echo "xsec,nevents" > "$output_file"

END=5000

for i in $(seq 1 $END); do
  echo $i
  xsec=""
  nbr=""

  lhe_file=/sdf/data/hps/physics2021/mc/gen/rad/lhe/rad_3pt74_$i.lhe.gz
  nevents=$(zgrep "Number of Events" "$lhe_file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')
  xsec=$(zgrep "Integrated weight (pb)" "$lhe_file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')

  echo "$xsec,$nevents" >> "$output_file"
done
