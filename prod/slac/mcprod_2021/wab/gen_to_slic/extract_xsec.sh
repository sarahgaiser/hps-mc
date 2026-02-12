#!/bin/bash

output_file="cross_sections_wab_pass5.txt"
echo "xsec,nevents" > "$output_file"

outlier_file="xsec_outliers.txt"
echo "index,xsec" > "$outlier_file"

END=1000

for i in $(seq 1 $END); do
  #echo $i
  xsec=""
  nevents=""

  lhe_file=/sdf/data/hps/physics2021/mc/gen/wab/lhe/1/wab_unweighted_events_${i}.lhe.gz
  nevents=$(zgrep "Number of Events" "$lhe_file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')
  xsec=$(zgrep "Integrated weight (pb)" "$lhe_file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')


  if [[ $xsec == *"E+9"* ]]; then
  	echo "Found outlier"
	echo "$i,$xsec" >> "$outlier_file"
  fi

  echo "$xsec,$nevents" >> "$output_file"
done
