#!/bin/bash
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --time=1-00:00:00
#SBATCH --mem=102400
#SBATCH -p standard
#SBATCH -o actinn.out
#SBATCH -A dolatshahi_rivanna

# first argument passed is the name of the folder containing the test data (barcodes, genes, matrix),
# Second argument is the type of file/folder ex (10X_V2, 10X_V3, txt, csv)


module load anaconda
python actinn_format.py -i $1 -o testdata -f $2
python actinn_predict.py -trs actinn_data/train_set.h5 -trl actinn_data/train_label.txt.gz -ts testdata.h5 
