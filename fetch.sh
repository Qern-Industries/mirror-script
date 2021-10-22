#!/usr/bin/bash
set -x

year=$(date +"%Y")
month=$(date +"%m")
day=$(date +"%d")
time=$(date +"%H-%M-%S")

pwd
echo "Update Start"
    git fetch --all
    git reset --hard origin/master
echo "Update Complete"

mkdir -p ~/cronlog/"${year}/${month}/${day}/${time}"/ || true
touch ~/cronlog/"${year}/${month}/${day}/${time}"/log || true

./sync.sh 2>&1 | tee -a ~/cronlog/"${year}/${month}/${day}/${time}"/log
