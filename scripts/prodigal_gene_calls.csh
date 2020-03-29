#!/bin/sh
#
##SBATCH
#SBATCH --job-name=prodigal
#SBATCH --time=72:00:00
#SBATCH --partition=shared

echo "Timestamp:"
date
echo "Starting prodigal"
~/work/lib/Prodigal-2.6.3/prodigal -i ../assembledContigs/contigs.fasta -o assembledContigs.output.txt -d assembledContigs.all_genes.fa -a assembledContigs.all_proteins.faa 
echo "Finished; timestamp"
date
