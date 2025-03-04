---
layout: page
title: ChIP-seq Analysis
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

# ChIP-seq analysis

## Introduction

I have finally decided to embark on the journey of learning how to analyze ChIP-seq data. One of the best ways to learn new bioinformatics skills is to reproduce results in scientific work that has already been published. After going through a few dozen research articles, only in Arabidopsis for simplicitiy, I've settled on the [following article](https://pmc.ncbi.nlm.nih.gov/articles/PMC5304350/) that has done ChIP-seq on WRKY transcription factors (TFs). In addition to having the mentioned ChIP-seq data, this article has a few other advantages: (i) it looks at three different WRKY TFs, (ii) it looks at the TF binding under control and Flg22-treated (plant immunity) conditions, (iii) RNA-seq data under similar conditions is also available, (iv) there's a follow up study with looking at ChIP-seq and RNA-seq in the triple knock-out WRKY mutant plants. While I’ve made an effort to ensure the accuracy of the analysis workflow presented here, I am still in the process of learning and improving my approach. I welcome feedback and suggestions, and I will keep this page updated.

[Paper 1](https://pmc.ncbi.nlm.nih.gov/articles/PMC5304350/){: .btn .btn-purple }
[Paper 2](https://onlinelibrary.wiley.com/doi/10.1111/tpj.14043){: .btn .btn-purple }

There are a lot of tutorials and guidelines on ChIP-seq analysis. I'll leave a few useful links below:
1. [ENCODE guidelines](https://pmc.ncbi.nlm.nih.gov/articles/PMC3431496/pdf/1813.pdf)
2. [Pipeline](https://giftbear.github.io/2024/02/27/ChIP-Seq_Pipeline/)
3. [Training](https://github.com/dagousket/chip_seq_training)
4. [Galaxy tutorial](https://shaunmahony.github.io/chip-seq-tutorial/)

## Data preparation

### Brief introduction

TODO

### Project structure

```
├── bams
│   ├── 
│   ├── 
│   ├── 
├── bams_filtered
│   ├── 
│   ├── 
│   ├── 
├── IDR
│   ├── W18HA_0h.idr.log
│   ├── W18HA_0h-idr
│   ├── W18HA_0h-idr.png
│   ├── ...
├── MACS3
│   ├── W18HA_0h_1_peaks.narrowPeak
│   ├── W18HA_0h_2_peaks.narrowPeak
│   ├── ...
├── reproduciblePeaks
│   └── 
└── ...
```

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

## Handling replicates using the Irreproducibility Discovery Rate (IDR)

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
extract the peaks that pass the `FDR p-value < 0.05` by running the command `bash idr.get.peaks.sh` that you can download from [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/idr.get.peaks.sh)

### Results

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.W18HA_2h.png?raw=true){: width="500" }

## Comparing binding sites between different conditions using DiffBind

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

We are going to use DiffBind in two different way. First, we are going to use the complete sample sheet to make a PCA plot and a clustered heatmap to see how similar the different samples are compared to each other. Second, we are going to treat the data from each TF seperately and use DESeq2 and edgeR to get a list of differentially occuring binding sites for each TF that we can use for downstream processing. Let's start from the first part, with the code being available after the figures. We can quickly discern that there is some variability in the peaks we extracted between the different samples. While this could be bona fide biological variability, it might be still be worth to go back and check if we have made a mistake at any of the steps above. Assuming we haven't done any mistakes, what we can see based from the PCA plot is that is that the WRLY33 and WRKY40 treatment vs control samples are better separated on the PC1 than the WRKY18 samples, where one of the control samples seems to be more similar to the treated samples. This is likely to post a problem when we will use DiffBind to conduct statistical testing. Having worked with plants and TFs, I can hypothesize that either some stress conditions, such as wounding, or aberrant transgene expression can lead to unexpected activation of TFs. This should be a reminder to us that, while the use of two biological replicates in many ChIP-seq experiments is prevalent, ChIP-seq experiments can be variable, even more variable than bulk RNA-seq, and that more biological replicates should be used (or, when constrained for resources, pooled samples from different plants). The clustered heatmap is telling us a similar story, although in this case, both WRKY18 control samples are clustered more closely together, and are more similar to the WRKY18 and WRKY40 treated samples than the treated WRKY33 samples.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.DiffBind.PCA.png?raw=true){: width="800" }

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.DiffBind.heatmap.png?raw=true){: width="800" }

```
library(DiffBind)

# Load the sample sheet
samples <- read.csv("sample_sheet.csv")

# Create a DiffBind object
dba_obj <- dba(sampleSheet = samples)


# Plot a PCA to visualize sample clustering
dba.plotPCA(dba_obj, label = DBA_CONDITION)

# Plot correlation heatmap
dba.plotHeatmap(dba_obj, ColAttributes = DBA_CONDITION)
```

For the second step we are just going to compare each TF separately between the treated and control conditions. We could use DiffBind to build a different or more complex design matrix, but we will skip it for the time being. We will also edit the data loaded from the sample sheet and set the `Factor` column to be the `Condition` column, while remove the data from the original `Factor` column. This way, we are left with information about the biological replicates and treatment when we loop over the unique TFs. For a later stage, when we will use MEME-ChIP for binding motif discovery, it is important to set the `summits` variable to a constant values (50) in the `dba.count` so the the peaks are re-centered and a so all peak ranges are the same size (2*50bp, in this case). As mentioned on the [MEME-ChIP website](https://meme-suite.org/meme/doc/meme-chip.html?man_type=web): ` Ideally the sequences should be all the same length, between 100 and 500 base-pairs long and centrally enriched for motifs. The immediate regions around individual ChIP-seq "peaks" from a transcription factor (TF) ChIP-seq experiment are ideal. The suggested 100 base-pair minimum size is based on the typical resolution of ChIP-seq peaks but it is useful to have more of the surrounding sequence to give CentriMo the power to tell if a motif is centrally enriched.`.

```
# Create a DiffBind object
dba_obj <- dba(sampleSheet = samples)

# List of transcription factors from the sample sheet
factors <- unique(samples$Factor)

# Loop through each transcription factor
for (factor in factors) {
  cat("Processing factor:", factor, "\n")
  
  # Subset the sample sheet for the current factor
  factor_samples <- samples[samples$Factor == factor, ]

  # Remove the Factor column and rename Condition to Factor
  factor_samples$Factor <- NULL
  colnames(factor_samples)[colnames(factor_samples) == "Condition"] <- "Factor"
  
  # Create a new DBA object for the current factor
  dba_obj <- dba(sampleSheet = factor_samples)
  
  # Count reads in binding sites
  dba_obj <- dba.count(dba_obj, summits = 50) # Set summits=TRUE if you want to re-center peaks
  
  # Define contrasts (untreated vs. treated)
  dba_obj <- dba.contrast(dba_obj, categories=DBA_FACTOR, minMembers = 2)
  
  # Perform differential analysis
  dba_obj <- dba.analyze(dba_obj, method = DBA_EDGER, bGreylist = FALSE, bBlacklist = FALSE) # DBA_DESEQ2,DBA_EDGER
  
  # Generate a report with significant sites (FDR < 0.05)
  dba_report <- dba.report(dba_obj, method = DBA_EDGER, th = 0.05, bUsePval = FALSE, DataType = DBA_DATA_GRANGES)
  
  # Export the report as a BED file
  output_bed <- paste0(factor, "_differential_binding_sites.bed")
  rtracklayer::export(dba_report, con = output_bed, format = "BED")
  
  cat("BED file for", factor, "saved to", output_bed, "\n")
}
```

## MEME-ChIP

MEME-ChIP seems to be a popular tool for motif analysis and discovery, which is something of interest when analyzing ChIP-seq data. I wrote a Python script to extract the sequences of the peaks from the genome file because I didn't want to use GRanges, which is the standard method. This way, after we get the BED files containing the coordinates for the DiffBind differential binding sites, we can generate the FASTA files by calling the `diffbind2fasta.py` script, that can be found on my [bio-informatics GitHub repo](https://github.com/eporetsky/bioinformatics-repo/tree/master/ChiP-seq). I should note that I didn't want to use GRanges because I just wanted to use my own genome FASTA file, and, as far as I can tell, adding custom genomes to GRanges is not straightforward. That said, until this is tested, I cannot guarantee that my script produces the same FASTA file as GRanges.

```
python diffbind2fasta.py -b WRKY18_differential_binding_sites.bed -f AtCol-0.fa -o WRKY18_differential_binding_sites.fa
python diffbind2fasta.py -b WRKY33_differential_binding_sites.bed -f AtCol-0.fa -o WRKY33_differential_binding_sites.fa
python diffbind2fasta.py -b WRKY40_differential_binding_sites.bed -f AtCol-0.fa -o WRKY40_differential_binding_sites.fa
```

And now we can run MEME-ChIP from the command-line or from their [website](https://meme-suite.org/meme/doc/meme-chip.html?man_type=web): 

```
meme-chip -oc WRKY18 WRKY18_differential_binding_sites.fa
meme-chip -oc WRKY18 WRKY33_differential_binding_sites.fa
meme-chip -oc WRKY18 WRKY40_differential_binding_sites.fa
```

As you can see from the results, we have detected the (T)TGAC(C/T) [W-box](https://en.wikipedia.org/wiki/W-box) binding motif for WRKY33 and WRKY40, but not for WRKY18. Although we have not looked at the actual DiffBind differential binding results yet, we anticipated not getting strong statistical signal for WRKY18, which is likely to be the reason for why we haven't detected the W-box binding motif. We will likely find the W-box binding motif if we just extract the the centered peaks without conducting the DiffBind analysis, as done in the paper. Interestingly, we did detect a somewhat modified (T)TGA(C/A)(C/T) W-box binding motif for WRKY33 that was not reported in the paper but could be interesting to follow up on. 

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.MEME.motifs.png?raw=true){: width="500" }

I have also uploaded the MEME outputs for the three WRKY TFs [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/MEME.WRKYs.zip) for further exploration. We can look at a few additional motifs that have been found by STREME, by pressing the `STREME` button in the HTML file. Additional details on how to interpret these results can be found [here](https://meme-suite.org/meme/doc/streme.html).

## ChIPseeker

### Brief introduction

TODO

[Tutorial](https://bioconductor.org/packages/devel/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html){: .btn .btn-green }

### Example result

Preliminary teaser with incomplete data analysis, but something seems to work.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/tutorials/chipseq/img.chipseeker.AvgProf.png?raw=true){: width="500" }
