---
layout: page
title: Nanopore Analysis
permalink: /tutorials/nanopore
nav_order: 4
parent: Tutorials
has_toc: false
---

This section is a **work in progress** and documents a full workflow for analyzing direct RNA-seq data from Oxford Nanopore, using the example dataset **PRJNA1264749**. The goal is to reproduce published results and explore additional discoveries using modern long-read tools.

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Nanopore Direct RNA-seq Analysis (WIP)

## Introduction

This tutorial walks through a full analysis of direct RNA-seq data generated with Oxford Nanopore technology. We use the public dataset **PRJNA1264749** as an example, aiming to reproduce published findings and explore new insights, including differential gene expression and alternative splicing.

The workflow covers:
- Quality control (QC)
- Alignment
- Quantification
- Differential gene expression (DGE)
- Alternative splicing analysis

All scripts and commands are provided, and the workflow is modular and reproducible.

---

## Data Preparation

### Example Dataset
- **Accession:** PRJNA1264749
- **Data:** Direct RNA-seq (Nanopore), WT and mutant (mettl5-1) lines, 3 replicates each
- **Directory structure:**
  - `PRJNA1264749/` contains all FASTQ files

### Environment Setup

Create an `environment.yml` for conda:
```yaml
name: nanopore-rnaseq
channels:
  - conda-forge
  - bioconda
dependencies:
  - python=3.9
  - minimap2
  - subread
  - isoquant
  - suppa
  - r-ggrepel
  - samtools
  - pandas
  - pip
  - parallel
```

Install and activate:
```bash
conda env create -f environment.yml
conda activate nanopore-rnaseq
pip install NanoPlot pycoQC "scipy<1.11" "statsmodels<1.15" pandas numpy suppa
```

---

## Downloading FASTQ Files

Before starting the analysis, download all FASTQ files for your experiment using the provided Python script. This script will download and verify all FASTQ files for a given ENA experiment accession (e.g., PRJNA1264749) and save them in a folder named after the experiment.

**Requirements:**
- Python 3
- pandas
- axel (for fast FTP downloads)

**Usage:**
```bash
python download.fastq.py
```
Edit the `experiment` variable in the script to your ENA accession if needed.

**What the script does:**
- Downloads all FASTQ files for the experiment using axel
- Renames files to {accession}.fastq.gz
- Verifies MD5 checksums
- Skips files that already exist and are verified

**Script docstring:**
```python
"""
download.fastq.py

Downloads all FASTQ files for a given ENA experiment accession (e.g., PRJNA1264749), verifies their MD5 checksums, and saves them in a folder named after the experiment.

Requirements:
- Python 3
- pandas
- axel (for fast FTP downloads)

Usage:
    python download.fastq.py

Edit the 'experiment' variable in the script to your ENA accession if needed.

This script will:
- Download all FASTQ files for the experiment using axel
- Rename files to {accession}.fastq.gz
- Verify MD5 checksums
- Skip files that already exist and are verified
"""
```

---

## Quality Control (QC)

Run QC on all FASTQ files using NanoPlot:
```bash
bash nanopore.qc.sh PRJNA1264749
```
Where `nanopore.qc.sh` is:
```bash
#!/usr/bin/env bash
# Usage: ./nanopore.qc.sh <experiment_folder>
set -euo pipefail
EXPERIMENT="$1"
QC_DIR="$EXPERIMENT/qc"
mkdir -p "$QC_DIR"
for fq in "$EXPERIMENT"/*.fastq "$EXPERIMENT"/*.fastq.gz; do
    if [ -e "$fq" ]; then
        fname=$(basename "$fq")
        outdir="$QC_DIR/${fname%.fastq*}_NanoPlot"
        NanoPlot --fastq "$fq" -o "$outdir"
    fi
done
echo "QC complete. Results in $QC_DIR/"
```

---

## Alignment

Align all reads to the reference genome using minimap2:
```bash
bash nanopore.aln.sh PRJNA1264749 AtCol-0.fa
```
Where `nanopore.aln.sh` is:
```bash
#!/usr/bin/env bash
# Usage: ./nanopore.aln.sh <experiment_folder> <reference.fa>
set -euo pipefail
EXPERIMENT="$1"
REF="$2"
BAM_DIR="$EXPERIMENT/bam"
mkdir -p "$BAM_DIR"
for fq in "$EXPERIMENT"/*.fastq "$EXPERIMENT"/*.fastq.gz; do
    if [ -e "$fq" ]; then
        fname=$(basename "$fq")
        sample="${fname%%.fastq*}"
        bam_out="$BAM_DIR/${sample}.bam"
        echo "Aligning $fq -> $bam_out"
        minimap2 -ax splice -uf -k14 "$REF" "$fq" | samtools sort -o "$bam_out"
        samtools index "$bam_out"
    fi
done
echo "Alignment and indexing complete. BAM files in $BAM_DIR/"
```

---

## Quantification

Count reads per gene using featureCounts:
```bash
bash nanopore.cnt.sh PRJNA1264749 AtCol-0.gtf
```
Where `nanopore.cnt.sh` is:
```bash
#!/usr/bin/env bash
# Usage: ./nanopore.cnt.sh <experiment_folder> <annotation.gtf>
set -euo pipefail
EXPERIMENT="$1"
GTF="$2"
BAM_DIR="$EXPERIMENT/bam"
QUANT_DIR="$EXPERIMENT/quant"
mkdir -p "$QUANT_DIR"
BAM_FILES=("$BAM_DIR"/*.bam)
if [ "${#BAM_FILES[@]}" -eq 0 ]; then
    echo "No BAM files found in $BAM_DIR."
    exit 1
fi
featureCounts -L -a "$GTF" -o "$QUANT_DIR/counts.txt" "${BAM_FILES[@]}"
echo "featureCounts complete. Results in $QUANT_DIR/counts.txt"
```

---

## Differential Gene Expression (DGE)

Run DGE analysis in R using edgeR:
```r
# nanopore.deg.R
library(edgeR)
library(ggplot2)
experiment <- "PRJNA1264749"
deg_dir <- file.path(experiment, "deg")
dir.create(deg_dir, showWarnings=FALSE, recursive=TRUE)
counts <- read.delim(file.path(experiment, "quant/counts.txt"), comment.char="#", row.names=1, check.names=FALSE)
counts <- counts[,6:ncol(counts)]
colnames(counts) <- basename(colnames(counts))
colnames(counts) <- sub("\\.[^.]*$", "", colnames(counts))
rownames(counts) <- sub("\\..*$", "", rownames(counts))
group_info <- read.csv("sample_table.csv", row.names=1)
counts <- counts[, rownames(group_info)]
group <- factor(group_info$condition)
dge <- DGEList(counts=counts, group=group)
keep <- filterByExpr(dge)
dge <- dge[keep, , keep.lib.sizes=FALSE]
dge <- calcNormFactors(dge)
design <- model.matrix(~group)
dge <- estimateDisp(dge, design)
fit <- glmQLFit(dge, design)
qlf <- glmQLFTest(fit, coef=2)
write.csv(topTags(qlf, n=Inf), file=file.path(deg_dir, "dge_edger_results.csv"))
pdf(file.path(deg_dir, "dge_edger_MAplot.pdf"))
plotMD(qlf)
dev.off()
logCPM <- cpm(dge, log=TRUE, prior.count=1)
pca <- prcomp(t(logCPM), scale.=TRUE)
pca_df <- data.frame(PC1 = pca$x[,1], PC2 = pca$x[,2], condition = group)
pdf(file.path(deg_dir, "dge_edger_PCAplot.pdf"))
ggplot(pca_df, aes(x=PC1, y=PC2, color=condition)) +
  geom_point(size=4) +
  labs(title="PCA of samples", x="PC1", y="PC2") +
  theme_minimal()
dev.off()
write.csv(logCPM, file=file.path(deg_dir, "cpm_matrix.csv"))
```

---

## Isoform Quantification (IsoQuant)

Run IsoQuant on all BAMs to get isoform-level TPMs:
```bash
python nanopore.isq.py PRJNA1264749 AtCol-0.fixed.gtf AtCol-0.fa
```
Where `nanopore.isq.py` is:
```python
# Only the IsoQuant step is run here; see the full script in the repo
# Output: PRJNA1264749/quant/isoquant_all/OUT/OUT.discovered_transcript_grouped_tpm.tsv
```

---

## Alternative Splicing Analysis (SUPPA2)

Run SUPPA2 event calculation and splicing analysis:
```bash
python nanopore.dsu.py PRJNA1264749 sample_table.csv
```
Where `nanopore.dsu.py` is:
```python
# See the full script in the repo for all steps:
# - Event calculation (generateEvents)
# - Combine .ioe files
# - Clean headers
# - Patch TPM file for missing transcripts
# - Remove 'gene_id' from header
# - Run psiPerEvent
# - Split files by condition
# - Run diffSplice
```

---

## Notes and Tips
- If your GTF file does not contain gene rows, use the provided `fix.gtf.py` script to add them before running IsoQuant.
- This workflow is a work in progress and will be updated as new best practices and tools emerge.

---

## References
- [SUPPA2 tutorial](https://github.com/comprna/SUPPA/wiki/SUPPA2-tutorial)
- [IsoQuant documentation](https://github.com/ablab/IsoQuant)
- [NanoPlot](https://github.com/wdecoster/NanoPlot)
- [edgeR](https://bioconductor.org/packages/release/bioc/html/edgeR.html)
- [Oxford Nanopore Technologies](https://nanoporetech.com/)

---

*This tutorial is under active development. Please check back for updates and improvements!* 