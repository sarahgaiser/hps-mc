#!/bin/bash

output_file="gen_info_tritrig.txt"
echo "xsec;uncert;nbr;exe_time" > "$output_file"

for file in /sdf/data/hps/physics2021/mc/gen/tritrig/pass01/logs/job.*.out; do
  xsec=""
  uncert=""
  nbr=""
  cputime=""
  while read -r line; do
    if [[ $line == Cross-section* ]]; then
      xsec=$(echo $line | awk '{print $3}')
      uncert=$(echo $line | awk '{print $5}')
    fi
    if [[ $line == Nb\ of\ events* ]]; then
      nbr=$(echo $line | awk '{print $5}')
    fi
    #if [[ $line == sum\ of\ cpu\ time* ]]; then 
    if [[ $line == hpsmc.job:INFO\ Execution\ of\ tritrig\ took* ]]; then
      #cputime=$(echo $line | awk '{print $8}')
      #minutes=$(echo $cputime | sed 's/m.*//')
      #seconds=$(echo $cputime | sed 's/.*m//' | sed 's/s//')
      #cputime=$(echo "$minutes + ($seconds / 60)" | bc -l)
      cputime=$(echo $line | awk '{print $6}')
      cputime=$(echo "($cputime / 60)" | bc -l)
      cputime=$(printf "%.2f" $cputime)
    fi
  done < "$file"
  echo "$xsec;$uncert;$nbr:$cputime" >> "$output_file"
done
