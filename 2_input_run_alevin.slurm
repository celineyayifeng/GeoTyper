#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p standard
#SBATCH -A dolatshahi_rivanna
#SBATCH -o run_alevin.out


module load gcc/9.2.0
module load salmon



# 1st arg: path to the FASTQ file containing cell barcodes + UMI raw sequences
# 2nd: path to the FASTQ file containing raw read-sequences, 
# 3rd: --dropseq / --chromium / --chromiumV3: tells the type of single-cell protocol of the input sequencing-library 
# 4th: transcript to gene map file, a tsv (tab-separated) file; default is the one we provide (txp2gene.tsv)
# Please refer to https://salmon.readthedocs.io/en/latest/alevin.html for more information regarding Alevin. 

# User may wish to quantify multiple replicates or samples together, treating them as if they are one library. 
# Alevin allows the user to provide a space-separated list of files to all of it’s options that expect input files (i.e. -1, -2).

salmon alevin -l ISR \
  -1 $1 \
  -2 $2 \
  --$3 -i index -p 10 -o alevin_output --tgMap $4 \
  --numCellBootstraps 30

