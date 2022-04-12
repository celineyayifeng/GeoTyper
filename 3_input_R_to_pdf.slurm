#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p largemem
#SBATCH -A dolatshahi_rivanna
#SBATCH -o slurm_outfile.txt

module load goolf/7.1.0_3.1.4  R/4.1.1

# all arguments ($*) passed after slurm file name run as Rscripts

# ex. sbatch 3_input_R_to_pdf.slurm lymphoma.R

Rscript $*
