## GeoTyper: Automated Pipeline from Raw scRNA-Seq Data to Cell Type Identification

GeoTyper is a standardized pipeline that integrates multiple scRNA-seq tools for processing raw sequence data extracted from NCBI GEO, visualization of results, statistical analysis, and cell type identification. This pipeline leverages existing tools, such as Cellranger from 10X Genomics, Alevin, and Seurat, to cluster cells and identify cell types based on gene expression profiles.

### Usage 

#### Importing Data from NCBI

https://kb.10xgenomics.com/hc/en-us/articles/115003802691-How-do-I-prepare-Sequence-Read-Archive-SRA-data-from-NCBI-for-Cell-Ranger- 

https://edwards.flinders.edu.au/fastq-dump/ 

List of all fastq-dump options: https://edwardslab.wpengine.com/fastq-dump-options/

Check Accession: https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=SRR6334436 

Example: 

module load sratoolkit 

fastq-dump --split-files --gzip SRR14684948



