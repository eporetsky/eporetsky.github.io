---
layout: page
title: Snakemake
permalink: /workflows/snakemake
nav_order: 3
parent: workflows
has_toc: false
---

The latest snakemake files can be found in my github bioinformatics-repo repository in the [GitHub repo](https://github.com/eporetsky/workflows). Additional information for specific workflows is provided in the specific sections below.

## Snakemake - RNA-seq

The goal is to create a couple of snakemake workflow files that take care of obtaining and processing RNA-seq data. Each file contains.

For processing RNA-seq data it makes more sense to run the workflow one sample at a time. In snakemake it is possible to tranverse DAG depth-first as explained [here](https://stackoverflow.com/questions/64173399/snakemake-tranverse-dag-depth-first). It is not necessary to run workflow this way, but that is how I am writing all my RNA-seq processing workflows.

```
1. Set a priority for each rule starting with 1 for the first rule
2. Call snakemake with the following argument: -j 1
```

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>


## Requirements

I use a clean conda environment to run snakemake workflows. I ran into errors in the past that were due to conda not installing the latest repositories of some packages by default. That is why I specify which version to install now. I still have trouble installing the latest available packages in some cases. I will include a conda spec-file with the exact environment that I use but until then I am including some the steps that are needed to run the workflows.
```
conda install -c conda-forge genozip
conda install -c conda-forge libgcc-ng=11.2.0
conda install -c bioconda fastp=0.23.2
conda install -c bioconda hisat2=2.2.1
conda install -c bioconda sambamba=0.8.2
conda install -c bioconda subread
```

Finally, I write all of the intermediate files on a ramdisk before writing them on the hard-drive. It does require having a large amount of RAM (>96gb) but it significantly reduces the wear and tear on the SSD drive and reduces analysis time by avoiding unnecessary compression/decompression steps. The 2 lines of code below require linux sudo privilege and will mount a ramdisk folder. That said, a mounted ramdisk is not required, only a folder named "ramdisk" is required. 

```
# To create a ramdisk folder
mkdir ramdisk
sudo mount -t tmpfs -o size=95000m tmpfs ramdisk/
```

## Getting the metadata for an RNA-seq BioProject

I prefer working with the European Nucleotide Archive (ENA - https://www.ebi.ac.uk/ena/browser/home) for all analysis steps. If you want to process a published RNA-seq dataset, a good place to start is by downloading the metadata for a BioProject using the Study Accession (PRJNAXXXXXX). I have made a [python script](https://github.com/eporetsky/bioinformatics-repo/blob/master/snakemake/ENA/ena_metadata_download.py) that downloads the metadata using the ENA API, based on their [data accessing tutorial](https://ena-docs.readthedocs.io/en/latest/retrieval/programmatic-access/file-reports.html). The script takes the Study Accession as an argument and saves the metadata as a CSV file with the ID name. The CSV file should contain all the needed information, inclduing sample descriptions and FTP download links. 

```
# Download BioProject metadata from ENA
python ena_metadata_download.py PRJNAXXXXXX
```


## From an SRA/ENA BioProject ID to count files
This [snakemake workflow](https://github.com/eporetsky/bioinformatics-repo/blob/master/snakemake/ENA/all2counts_ena.smk) does not require an existing ENA metadata file, just a Study Accession, a HISAT2 genome index and a genome GTF file. The index and GTF files should have the same name  

```
snakemake -F -p -j1 --keep-going --snakefile all2counts_ena.smk --config sra=PRJNA123456 idx=Zmays_493_APGv4_Phytozome
```