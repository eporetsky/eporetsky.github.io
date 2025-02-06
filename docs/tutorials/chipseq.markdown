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

TODO

### Notes

Notes:
1. I am relying on FASTP for trimming and filtering low-quality reads but there might be more appropriate approaches
2. I have decided to use HISAT2 with the --no... parameter. Other aligners, such as bowtie, are more popular for alignment of DNA reads
3. I am using SAMBAMBA to filter duplicated reads, multimapping, and ...

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/files/UGT72B27.afill.jpg?raw=true){: width="600" }

## 1. Initial peak calling

### Brief introduction

We are going to model-based Analysis of ChIP-Seq (MACS3) for peak calling for identifying transcript factor binding sites. 

[MACS3](https://github.com/macs3-project/MACS){: .btn .btn-blue }
[Tutorial](https://github.com/macs3-project/MACS/blob/master/docs/source/docs/Advanced_Step-by-step_Peak_Calling.md){: .btn .btn-green }

### Running MACS3

```
macs3 callpeak -t  SRR4048207.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam --name W18HA_0h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048193.bam SRR4048194.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam --name W33HA_0h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048195.bam -c SRR4048192.bam SRR4048204.bam --name W33HA_2h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048196.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam  --name W18HA_0h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048197.bam SRR4048198.bam -c SRR4048192.bam SRR4048204.bam --name W18HA_2h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048200.bam SRR4048199.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam --name W40HA_0h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048201.bam SRR4048202.bam -c SRR4048192.bam SRR4048204.bam --name W40HA_2h_1  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048205.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam --name W33HA_0h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048206.bam -c SRR4048192.bam SRR4048204.bam --name W33HA_2h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048208.bam -c SRR4048192.bam SRR4048204.bam --name W18HA_2h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048209.bam -c SRR4048190.bam SRR4048191.bam SRR4048203.bam --name W40HA_0h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
macs3 callpeak -t SRR4048210.bam -c SRR4048192.bam SRR4048204.bam --name W40HA_2h_2  -q 0.05 -f BAM -g 119482012 --bdg --outdir ../MACS3
```

### On using a too low value for -q

When I used -q 0.01, a few samples did not pass the threshold for called peaks. This is not a critical parameter, but it could be useful to lower the 
the value to reduce the number of peaks if the data seems noisy.

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

```
idr --samples W18HA_0h_1_peaks.narrowPeak W18HA_0h_2_peaks.narrowPeak \
    --input-file-type narrowPeak \
    --rank p.value \
    --output-file Nanog-idr \
    --plot \
    --log-output-file W18HA_0h.idr.log
```

## ChIPseeker

### Brief introduction

TODO

[Tutorial](https://bioconductor.org/packages/devel/bioc/vignettes/ChIPseeker/inst/doc/ChIPseeker.html){: .btn .btn-green }

### Example result

Preliminary teaser with incomplete data analysis, but something seems to work.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_chipseq_AvgProf.png?raw=true){: width="500" }
