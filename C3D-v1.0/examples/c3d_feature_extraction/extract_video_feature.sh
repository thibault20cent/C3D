#!/bin/bash

cd ~/Documents/PROG/MICA/C3D/C3D-v1.0/examples/c3d_feature_extraction
mkdir -p output
rm -rf output/*
while read -r LINE; do
echo "$LINE"
stringLabel=$(dirname "$LINE")
intLabel=$(grep -w $stringLabel classInd.txt | awk '{a+=$0;print a}')
python extract_C3D_feature.py ~/Documents/PROG/MICA/UCF101/$(echo "$LINE" | tr -d '\r') c3d_ucf101_finetune_whole_iter_20000 output/${LINE%.*}/csv "$intLabel"
done < "$1"
