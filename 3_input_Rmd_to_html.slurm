#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p standard
#SBATCH -A dolatshahi_rivanna
#SBATCH -o 3_input_Rmd_to_html.out


module load goolf/7.1.0_3.1.4  R/4.1.1
module load pandoc

# first argument passed after slurm file name the path to the Rmd file to knit to an html file, second arg the name of the output html file

# ex. sbatch 3_input_Rmd_to_html.slurm lymphoma_test.Rmd lymphoma_data.html

Rscript -e "rmarkdown::render('$1',output_file='$2')"
