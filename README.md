# GeoTyper: Automated Pipeline from Raw scRNA-Seq Data to Cell Type Identification

GeoTyper is a standardized pipeline that integrates multiple scRNA-seq tools for processing raw sequence data extracted from NCBI GEO, visualization of results, statistical analysis, and cell type identification. This pipeline leverages existing tools, such as Cellranger from 10X Genomics, Alevin, and Seurat, to cluster cells and identify cell types based on gene expression profiles.

## Usage 

### 1. Importing Data from NCBI

1_input_fastq_dump.slurm

Purpose: download FASTQ files from NCBI GEO and (optionally) split files into Read 1 (R1 → cell barcodes) and Read 2 (R2 → tagged cDNA)

Directions: when submitting job list FASTQ SRA Run Selector Ascension Numbers after slurm file name

*$ in file signifies all variable names passed to file

Ex. sbatch input_fastq_dump.slurm SRR14684940 SRR14684940 → runs for the first SRA file and then the second

### 2. Implementing and running Cellranger Count or Alevin

2_input_cellranger_count.slurm

Purpose: run Cellranger Count for paired FASTQ files (i.e., R1, R2) from 10X Genomics

Output: barcodes.tsv.gz (cell barcodes → columns), features.tsv.gz (gene names → rows), matrix.mtx.gz (counts data)

Directions:
When submitting a job supply the following arguments after the slurm file name:
- Name of output directory to create (--id=$1 in slurm file)
- Path to directory with the FASTQs (--fastqs=$2 in slurm file)
- Path to samples to use in analysis, i.e., beginning of FASTQ names (--sample=$3 in slurm file)
- Path to transcriptome reference file / folder (--transcriptome=$4 in slurm file)
- Ex. sbatch input_cellranger_count.slurm run_count_lymphoma /project/Dolatshahi_Lab/MSDS/Clean_Final/cellranger_lymhoma/test test_sample1,test_sample2,test_sample3 /project/Dolatshahi_Lab/MSDS/Clean_Final/refdata-cellranger-GRCh38-3.0.0

Example: 
- Name of output directory: run_count_lymphoma
- Path to directory with FASTQs: /project/Dolatshahi_Lab/MSDS/Clean_Final/cellranger_lymhoma/test
- Path to samples to use in analysis: test_sample1,test_sample2,test_sample3 
- Path to transcriptome reference: /project/Dolatshahi_Lab/MSDS/Clean_Final/refdata-cellranger-GRCh38-3.0.0

2_input_run_alevin.slurm

Purpose: run Alevin for paired FASTQ files (i.e., R1, R2) from Drop-seq, 10x-Chromium v1/2/3, inDropV2, CELSeq ½, Quartz-Seq2, sci-RNA-seq3

Output: quants_mat.gz (compressed count matrix), quants_mat_col.txt (gene IDs), quants_mat_row.txt (CBs, or cell barcodes), quants_tier_mat.gz (tier categorization of matrix)

Directions:

When submitting a job supply the following arguments after the slurm file name:
- Path to the FASTQ file(s) containing the cell barcodes (CBs) and raw unique molecular identifiers (UMIs), i.e., Read 1 or R1 (-1 $1 in slurm file)
- Path to the FAST file(s) containing the raw sequence reads, i.e., Read 2 or R2 (-2 $2 in slurm file)
- Type of single-cell protocol of the input sequencing library, e.g., –dropseq, –chromium, –chromiumV3 (--$3 in slurm file)
- Transcript to the gene map file, a tsv (tab-separated) file  → default the one provided in the Clean_Final folder, txp2gene.tsv (--tgMap $4)

Ex. sbatch 2_input_run_alevin.slurm 

### 3. Downstream Analyses with knitted html or pdf output

3_input_R_to_pdf.slurm

Purpose: run an R script (e.g., with Seurat code) and output a PDF file (with plots only)

Directions:

When submitting a job add the path to the R script(s) to convert to PDF after the slurm file name

Ex. sbatch 3_input_R_to_pdf.slurm lymphoma.R

3_input_Rmd_to_html.slurm

Purpose: run an R script or .Rmd file and knit to an html file

Directions:

When submitting a job supply the following arguments after the slurm file name:

The path to the R script or .Rmd file (‘$1’ in slurm file)

The desired name of the output html file (output_file=’$2’ in file file)

Ex. sbatch 3_input_Rmd_to_html.slurm lymphoma.Rmd lymphoma_data.html

## Additional Resources 

https://kb.10xgenomics.com/hc/en-us/articles/115003802691-How-do-I-prepare-Sequence-Read-Archive-SRA-data-from-NCBI-for-Cell-Ranger- 

https://edwards.flinders.edu.au/fastq-dump/ 

List of all fastq-dump options: https://edwardslab.wpengine.com/fastq-dump-options/

Check Accession: https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR6334436 



