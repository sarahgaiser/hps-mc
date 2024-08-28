#!/bin/bash

output_file="cross_sections_wab.csv"
echo "xsec" > "$output_file"

for file in /fs/ddn/sdf/group/hps/mc/wab/gen/3pt74/wab_3pt74_*.lhe.gz; do
    #formatted_xsec=$(echo "$xsec" | awk '{printf "%.5E", $1}')
    cross_section=$(zgrep "Integrated weight (pb)" "$file" | awk -F ': ' '{print $2}' | awk '{printf "%.5E", $1}')
    echo "$cross_section" >> "$output_file"
done

