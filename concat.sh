#!/bin/bash

OUTPUT0=($(ls -d ./output/0/????.jpg))
OUTPUT1=($(ls -d ./output/1/????.jpg))
OUTPUT2=($(ls -d ./output/2/????.jpg))
OUTPUT3=($(ls -d ./output/3/????.jpg))

mkdir -p ./output/result

for i in $(seq 1 ${#OUTPUT0[@]}); do
    j=$(expr $i - 1)
    convert "${OUTPUT0[$j]}" "${OUTPUT1[$j]}" +append /tmp/1.jpg
    convert "${OUTPUT2[$j]}" "${OUTPUT3[$j]}" +append /tmp/2.jpg
    convert /tmp/1.jpg /tmp/2.jpg -append "./output/result/$j.jpg"
done
