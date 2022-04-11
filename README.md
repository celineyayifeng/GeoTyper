## GeoTyper: Automated Pipeline from Raw scRNA-Seq Data to Cell Type Identification

GeoTyper is a standardized pipeline that integrates multiple scRNA-seq tools for processing raw sequence data extracted from NCBI GEO, visualization of results, statistical analysis, and cell type identification. This pipeline leverages existing tools, such as Cellranger from 10X Genomics, Alevin, and Seurat, to cluster cells and identify cell types based on gene expression profiles.

### Usage 

#### Importing Data from NCBI

https://kb.10xgenomics.com/hc/en-us/articles/115003802691-How-do-I-prepare-Sequence-Read-Archive-SRA-data-from-NCBI-for-Cell-Ranger- 

https://edwards.flinders.edu.au/fastq-dump/ 

List of all fastq-dump options: https://edwardslab.wpengine.com/fastq-dump-options/

Check Accession: https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR6334436 

Example of how to structure the slurm file: 

#!/bin/bash

#SBATCH -N 1

#SBATCH -n 1

#SBATCH --time=1-00:00:00

#SBATCH --mem=102400

#SBATCH -p standard

#SBATCH -A dolatshahi_rivanna

#SBATCH -o input_fastq_dump.out


module load sratoolkit

#access FASTQ(s) with given accession number(s) --> split into R1 (cell barcodes), R2 (cDNA) gzipped FASTQs

#all arguments ($*) passed after slurm file name are accession numbers for FASTQs

#ex. sbatch 1_input_fastq_dump.slurm SRR14684940 SRR14684941

fastq-dump --split-files --gzip  $*





