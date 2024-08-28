#!/bin/bash

output_file="cross_sections_tritrig.csv"
echo "xsec" > "$output_file"

for file in /fs/ddn/sdf/group/hps/mc/tritrig/gen/3pt74/tritrig_3pt74_*.lhe.gz; do
    cross_section=$(zgrep "Integrated weight (pb)" "$file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')
    echo "$cross_section" >> "$output_file"
done

