#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p largemem
#SBATCH -A dolatshahi_rivanna
#SBATCH -o input_cellranger_count.txt


module load cellranger/6.0.1

# after slurm file name: 1st arg: id (name of folder for output), 2nd: path to FASTQs, 3rd: sample(s) to use if multiple, 4th: ref transcriptome path

# ex. sbatch 2_input_cellranger_count.slurm run_count_lymphoma /project/Dolatshahi_Lab/MSDS/Clean_Final/cellranger_lymphoma/test test_sample1,test_sample2,test_sample3 /project/Dolatshahi_Lab/MSDS/Clean_Final/refdata-cellranger-GRCh38-3.0.0

cellranger count --id=$1 \
--fastqs=$2 \
--sample=$3 \
--transcriptome=$4
