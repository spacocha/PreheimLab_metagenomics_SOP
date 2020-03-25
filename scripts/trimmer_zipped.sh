#!/bin/bash -l

#SBATCH
#SBATCH --job-name=trimmo38
#SBATCH --time=2:00:00

#submit as an array with the number of lines of forward or reverse file

module load trimmomatic/0.38

#import run specific variables
source ./trimmer.config

#choose the fastq file to work on
FWD_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $FORWARD`
REV_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $REVERSE`

#This assumes they are zipped but you provide the unzipped name
gunzip $LIB_DIR/${FWD_FQ}.gz
gunzip $LIB_DIR/${REV_FQ}.gz

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/$FWD_FQ  $LIB_DIR/$REV_FQ \
$ASSEM/${FWD_FQ}_s1_pe $ASSEM/${FWD_FQ}_s1_se $ASSEM/${REV_FQ}_s2_pe $ASSEM/${REV_FQ}_s2_se \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:33 MINLEN:50

echo "Complete: trimmomatic $SLURM_ARRAY_TASK_ID"
