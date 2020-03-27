#!/bin/sh
#SBATCH
#SBATCH --job-name=SPDMainstem
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

source ./SPDS_start.config

free -mh
getconf _NPROCESSORS_ONLN

$SPADES --meta -1 $FWD_FQ -2 $REV_FQ -s $SE_FQ -o $OUT_DIR --threads 48 --memory 960

