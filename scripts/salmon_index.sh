#!/bin/bash -l

#SBATCH
#SBATCH --job-name=CB_si
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBAtCH --ntasks-per-node=1
#SBATCH --cpus-per-task=48
#SBATCH --partition=lrgmem

module load salmon/1.1.0

#cp ../Prodigal_gene_calls/assembledContigs.all_genes.fa .
#gzip assembledContigs.all_genes.fa
salmon index -t assembledContigs.all_genes.KO_only.fa.gz -i assembledContig.all_gene.KO_only_index -p 1

