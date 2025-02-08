---
layout: page
title: ChIP-seq
permalink: /tutorials/chipseq
nav_order: 3
parent: Tutorials
has_toc: false
---

This section includes code for processing and analyzing different aspects of ChIP-seq data analysis. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# ChIP-seq analysis (Example: three plant WRKY TFs)

## Introduction

I have finally decided to embark on the journey of learning how to analyze ChIP-seq data. 
One of the best ways to learn new bioinformatics skills is to reproduce results in scientific work that has already been published. 
After going through a few dozen research articles, only in Arabidopsis for simplicitiy, I've settled on the [following article](https://pmc.ncbi.nlm.nih.gov/articles/PMC5304350/) 
that has done ChIP-seq on WRKY transcription factors (TFs). In addition to having the mentioned ChIP-seq data, this article has a few
other advantages: (i) it looks at three different WRKY TFs, (ii) it looks at the TF binding under control and Flg22-treated (plant immunity) 
conditions, (iii) RNA-seq data under similar conditions is also available, (iv) there's a follow up study with looking at ChIP-seq and 
RNA-seq in the triple knock-out WRKY mutant plants. While I’ve made an effort to ensure the accuracy of the analysis workflow presented here, 
I am still in the process of learning and improving my approach. I welcome feedback and suggestions, and I will keep this page updated.

[Paper 1](https://pmc.ncbi.nlm.nih.gov/articles/PMC5304350/){: .btn .btn-purple }
[Paper 2](https://onlinelibrary.wiley.com/doi/10.1111/tpj.14043){: .btn .btn-purple }

There are a lot of tutorials and guidelines on ChIP-seq analysis. I'll leave a few useful links below:
1. [ENCODE guidelines](https://pmc.ncbi.nlm.nih.gov/articles/PMC3431496/pdf/1813.pdf)
2. [Pipeline](https://giftbear.github.io/2024/02/27/ChIP-Seq_Pipeline/)
3. [Training](https://github.com/dagousket/chip_seq_training)
4. [Galaxy tutorial](https://shaunmahony.github.io/chip-seq-tutorial/)


## Data preparation

### Brief introduction

### Project structure

project/
├── bams/
│   ├── 
│   ├── 
│   ├── 
├── bams_filtered/
│   ├── 
│   ├── 
│   ├── 
├── IDR/
│   ├── W18HA_0h.idr.log
│   ├── W18HA_0h-idr
│   ├── W18HA_0h-idr.png
│   ├── ...
├── MACS3/
│   ├── W18HA_0h_1_peaks.narrowPeak
│   ├── W18HA_0h_2_peaks.narrowPeak
│   ├── ...
├── reproduciblePeaks/
│   └── 
└── ...

### Aligning raw reads to the genome

We are going to prepare the BAM alignment files in three steps. First, we will download the FASTQ file containing the raw reads for the
ChIP-seq experiment. We are going to use FASTP to filter low quality reads and trim adapters. While I don't use it for RNA-seq, FASTP has
an option `--dedup` to filter duplicated reads from the FASTQ file (we are going to do another round of filtering duplicated reads using
SAMBAMBA, I assume it can't hurt). Second, we will use HISAT2 to align the reads to the genome. HISAT2 is not the standard aligner used for 
DNA-seq alignment, as is the case with ChIP-seq, but we are going to use the `--no-spliced-alignment` parameter which should do the trick. 
As far as I can tell, HISAT2 has not been benchmarked against other aligners for this task, so take this into consideration.

```
TODO
```

### Filtering and merging BAM files

Once we have the first round of BAM files, we going to run SAMBAMBA to run another round of filtering, as explained [here](https://gist.github.com/sbamin/27acf13f2a28161efbf89a273559bca4).
This might not be relevant for most experiments, but for this experiments, some of the biological replicates are split across two BAM files.
Although you don't need this if you are only using the MACS3 outputs, as you can specify multiple input BAM files, other tools, such as DiffBind,
require a single input BAM file to run the analysis. To make the analysis more consistent, we are going to first use SAMBAMBA to merge and then
sort the split BAM files. For the non-split BAM files we are just going to copy and rename them a more infromative name.

```
mkdir -p bams_filtered
sambamba merge -t 72 merged.bam bams/SRR4048197.bam bams/SRR4048198.bam && sambamba sort -t 72 -o sorted.bam merged.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" merged.bam -o bams_filtered/W18HA_2h_1.bam
sambamba merge -t 72 merged.bam bams/SRR4048193.bam bams/SRR4048194.bam && sambamba sort -t 72 -o sorted.bam merged.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" merged.bam -o bams_filtered/W33HA_0h_1.bam
sambamba merge -t 72 merged.bam bams/SRR4048200.bam bams/SRR4048199.bam && sambamba sort -t 72 -o sorted.bam merged.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" merged.bam -o bams_filtered/W40HA_0h_1.bam
sambamba merge -t 72 merged.bam bams/SRR4048201.bam bams/SRR4048202.bam && sambamba sort -t 72 -o sorted.bam merged.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" merged.bam -o bams_filtered/W40HA_2h_1.bam
sambamba merge -t 72 merged.bam bams/SRR4048190.bam bams/SRR4048191.bam && sambamba sort -t 72 -o sorted.bam merged.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" merged.bam -o bams_filtered/WT_0h_1.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048196.bam -o bams_filtered/W18HA_0h_1.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048207.bam -o bams_filtered/W18HA_0h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048208.bam -o bams_filtered/W18HA_2h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048205.bam -o bams_filtered/W33HA_0h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048195.bam -o bams_filtered/W33HA_2h_1.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048206.bam -o bams_filtered/W33HA_2h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048209.bam -o bams_filtered/W40HA_0h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048210.bam -o bams_filtered/W40HA_2h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048203.bam -o bams_filtered/WT_0h_2.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048192.bam -o bams_filtered/WT_2h_1.bam
sambamba view -t 72 -h -f bam -F "mapping_quality >= 1 and not (unmapped or secondary_alignment) and not ([XA] != null or [SA] != null)" bams/SRR4048204.bam -o bams_filtered/WT_2h_2.bam
rm sorted.*
rm merged.*
```

### Notes

Notes:
1. I am relying on FASTP for trimming and filtering low-quality reads but there might be more appropriate approaches
2. I have decided to use HISAT2 with the --no... parameter. Other aligners, such as bowtie, are more popular for alignment of DNA reads
3. I am using SAMBAMBA to filter duplicated reads, multimapping, and ...

## 1. Initial peak calling

### Brief introduction

We are going to model-based Analysis of ChIP-Seq (MACS3) for peak calling for identifying transcript factor binding sites. 

[MACS3](https://github.com/macs3-project/MACS){: .btn .btn-blue }
[Tutorial](https://github.com/macs3-project/MACS/blob/master/docs/source/docs/Advanced_Step-by-step_Peak_Calling.md){: .btn .btn-green }

### Running MACS3

```
mkdir -p MACS3
macs3 callpeak -t bams_filtered/W18HA_0h_1.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W18HA_0h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W18HA_0h_2.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W18HA_0h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W18HA_2h_1.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W18HA_2h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W18HA_2h_2.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W18HA_2h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W33HA_0h_1.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W33HA_0h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W33HA_0h_2.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W33HA_0h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W33HA_2h_1.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W33HA_2h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W33HA_2h_2.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W33HA_2h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W40HA_0h_1.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W40HA_0h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W40HA_0h_2.bam -c bams_filtered/WT_0h_1.bam bams_filtered/WT_0h_2.bam --name W40HA_0h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W40HA_2h_1.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W40HA_2h_1  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
macs3 callpeak -t bams_filtered/W40HA_2h_2.bam -c bams_filtered/WT_2h_1.bam bams_filtered/WT_2h_2.bam --name W40HA_2h_2  -q 0.05 --nomodel --extsize 125 -f BAM -g 119482012 --bdg --outdir MACS3/
```

### Handling samples with few peaks

I initially ran MACS3 callpeaking without the `--nomodel --extsize 125` parameters but I ended up receiving the warning message below, while
no outputfiles were generated. After looking over a few succesfull MACS3 runs, I saw that the estimated `--extsize` parameters was between 122
and 147. For consistency, I ended up using a `--extsize 125` for all samples, with a smaller number supposedely producing narrower peaks,
which is what I expect for TF binding.

```
INFO  @ 05 Feb 2025 21:27:47: [224 MB] #2 Total number of paired peaks: 38 
WARNING @ 05 Feb 2025 21:27:47: [224 MB] #2 MACS3 needs at least 100 paired peaks at + and - strand to build the model, but can only find 38!
Please make your MFOLD range broader and try again. If MACS3 still can't build the model, we suggest to use --nomodel and --extsize 147 or other fixed number instead. 
```

### On pooling biological replicates

One open question is the proper use of control input samples. Despite the biological replicates between labeled with _1 and _2, the choice of 
control samples among the two biological replicates seems arbitrary, as neither one actually pairs with a specific ChIP-seq sample (to the best 
of my knowledge). To the best of my understanding, it’s better to keep paired input and ChIP-seq samples paired. This is likely to ensures the 
control is more representative of the true background. If input samples are not paired to specific biological replicates and are highly similar 
(e.g., same tissue, same preparation method, same sequencing depth), pooling them together is likely to improve peak calling and reduce 
variability, at a small price of reducing the validitiy of the statistical inference results.

## 2. Handling replicates using the Irreproducibility Discovery Rate (IDR)

### Brief introduction

TODO

[IDR](https://github.com/nboley/idr){: .btn .btn-blue }
[Tutorial](https://hbctraining.github.io/Intro-to-ChIPseq/lessons/07_handling-replicates-idr.html){: .btn .btn-green }
[Paper](https://arxiv.org/pdf/1110.4705){: .btn .btn-blue }

### Running IDR

This part is a little bit longer so I made a bash file, `idr.sh` that you can download [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/idr.sh?raw=true). 
Put it in your experiment folder and run `bash idr.sh`.

```
mkdir -p IDR
mkdir -p IDR/logs
idr --samples MACS3/W18HA_0h_1_peaks.narrowPeak MACS3/W18HA_0h_2_peaks.narrowPeak \
    --input-file-type narrowPeak \
    --rank p.value \
    --output-file IDR/W18HA_0h \
    --plot \
    --log-output-file IDR/logs/W18HA_0h.idr.log
```

### Extracting reproducible peaks

After running IDR, we now have some statistics about how reproducible are the peaks for each condition. We can use this information to 
extract the peaks that pass the `FDR p-value < 0.05` by running the command `bash idr.get.peaks.sh` that you can download from [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/idr.get.peaks.sh?raw=true)

### Results

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.W18HA_2h.png?raw=true){: width="500" }

## 3. Comparing binding sites between different conditions using DiffBind

### Short introduction

DiffBind is an R package that computes differentially bound sites from multiple biological replixcate samples of ChIP-seq experiments.
It uses the affinity (quantitative) data that we are going to provide it based on the selected reproducble peaks from the IDR analysis. 
Using DiffBind, we should be able to calculate occupancy (overlap) between the control and treatment conditions while providing each
separate TF as a separate factor for the experimental design. After running the analysis, we should get the differentially occupied TF
binding sites and make a number of informative plots.

### Final preparations

If you installed the conda environment using the yml file I provided, you should be able to open RStudio by running the command `rstudio`
in you commandline. This RStudio should come with the DiffBind library installed so you don't have to deal with installation process that
I've had trouble getting to properly install with the non-conda base R environment. Make sure you open it from the base environment so the
relative path matches the expectations in the code below. If you succesfully ran all the code above, you should have all the files needed
except for the `sample_sheet.csv` file, that you can download from [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/sample_sheet.csv?raw=true) 
or copy from below. Don't forget to change working directory (`Session -> Set Working Directory -> To Source File Location`).

```
SampleID,Condition,Replicate,Factor,BamReads,Peaks,PeakCaller
W18HA_0h_1,Control,1,WRKY18,bams_filtered/W18HA_0h_1.bam,reproduciblePeaks/W18HA_0h_1_reproducible_peaks.bed,narrow
W18HA_0h_2,Control,2,WRKY18,bams_filtered/W18HA_0h_2.bam,reproduciblePeaks/W18HA_0h_2_reproducible_peaks.bed,narrow
W18HA_2h_1,Treatment,1,WRKY18,bams_filtered/W18HA_2h_1.bam,reproduciblePeaks/W18HA_2h_1_reproducible_peaks.bed,narrow
W18HA_2h_2,Treatment,2,WRKY18,bams_filtered/W18HA_2h_2.bam,reproduciblePeaks/W18HA_2h_2_reproducible_peaks.bed,narrow
W33HA_0h_1,Control,1,WRKY33,bams_filtered/W33HA_0h_1.bam,reproduciblePeaks/W33HA_0h_1_reproducible_peaks.bed,narrow
W33HA_0h_2,Control,2,WRKY33,bams_filtered/W33HA_0h_2.bam,reproduciblePeaks/W33HA_0h_2_reproducible_peaks.bed,narrow
W33HA_2h_1,Treatment,1,WRKY33,bams_filtered/W33HA_2h_1.bam,reproduciblePeaks/W33HA_2h_1_reproducible_peaks.bed,narrow
W33HA_2h_2,Treatment,2,WRKY33,bams_filtered/W33HA_2h_2.bam,reproduciblePeaks/W33HA_2h_2_reproducible_peaks.bed,narrow
W40HA_0h_1,Control,1,WRKY40,bams_filtered/W40HA_0h_1.bam,reproduciblePeaks/W40HA_0h_1_reproducible_peaks.bed,narrow
W40HA_0h_2,Control,2,WRKY40,bams_filtered/W40HA_0h_2.bam,reproduciblePeaks/W40HA_0h_2_reproducible_peaks.bed,narrow
W40HA_2h_1,Treatment,1,WRKY40,bams_filtered/W40HA_2h_1.bam,reproduciblePeaks/W40HA_2h_1_reproducible_peaks.bed,narrow
W40HA_2h_2,Treatment,2,WRKY40,bams_filtered/W40HA_2h_2.bam,reproduciblePeaks/W40HA_2h_2_reproducible_peaks.bed,narrow
```

### Running DiffBind

```
library(DiffBind)

# Load the sample sheet
samples <- read.csv("sample_sheet.csv")

# Create a DiffBind object
dba_obj <- dba(sampleSheet = samples)

# Plot a PCA to visualize sample clustering
dba.plotPCA(dba_obj, label = DBA_CONDITION)

# Perform binding affinity analysis for Control vs. Treatment
contrast <- dba.contrast(dba_obj, group1 = dba_obj$masks$Control, group2 = dba_obj$masks$Treatment)
dba_obj <- dba.analyze(contrast)

# Retrieve differentially bound sites
diff_sites <- dba.report(dba_obj)

# Save differential binding results to a file
write.csv(as.data.frame(diff_sites), "diffbind_control_vs_treatment.csv")

# Subset for treatment condition only and compare TFs
treatment_mask <- dba_obj$masks$Treatment
treatment_obj <- dba(dba_obj, mask = treatment_mask)

# Perform a three-way contrast for TF comparison under treatment
tf_contrast <- dba.contrast(treatment_obj, categories = DBA_FACTOR)
treatment_obj <- dba.analyze(tf_contrast)

# Retrieve TF-specific differential binding
tf_diff_sites <- dba.report(treatment_obj)
write.csv(as.data.frame(tf_diff_sites), "diffbind_tf_comparison_treatment.csv")

# Visualize results with a PCA for TFs under treatment
dba.plotPCA(treatment_obj, label = DBA_FACTOR)
```

### Results

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.DiffBind.PCA.png?raw=true){: width="500" }

## ChIPseeker

### Brief introduction

TODO

[Tutorial](https://bioconductor.org/packages/devel/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html){: .btn .btn-green }

### Example result

Preliminary teaser with incomplete data analysis, but something seems to work.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.chipseeker.AvgProf.png?raw=true){: width="500" }
