#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p standard
#SBATCH -A dolatshahi_rivanna
#SBATCH -o input_fastq_dump.out


module load sratoolkit

# access FASTQ(s) with given accession number(s) --> split into R1 (cell barcodes), R2 (cDNA) gzipped FASTQs

# all arguments ($*) passed after slurm file name are accession numbers for FASTQs

# ex. sbatch 1_input_fastq_dump.slurm SRR14684940 SRR14684941

fastq-dump --split-files --gzip  $*
