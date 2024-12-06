---
layout: page
title: Protein Annotation
permalink: /tutorials/annotation
nav_order: 1
parent: Tutorials
has_toc: false
---

This section includes notes and code for functional annotation of protein sequences using different databases. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# InterProScan

[Paper](https://academic.oup.com/bioinformatics/article/30/9/1236/237988){: .btn .btn-purple }
[GitHub](https://github.com/ebi-pf-team/interproscan){: .btn .btn-blue }
[Webserver](https://www.ebi.ac.uk/interpro/about/interproscan/){: .btn .btn-green }

InterProScan is one of the most popular protein sequence annotation tools that incorporates a number of different databases. 

## Editing the interproscan.sh file

I am not sure if this is necessary, but I think that I sometimes run into memory issues when running InterProScan on large FASTA files (>100k sequences). 
If you have the resource available on your computer, it might help to change the last few lines in the `interproscan.sh`. Below you can see the edited 
part where I changed the `ParallelGCThreads` to 72, `-Xms` to 10G and `-Xmx` to 100G.

```
"$JAVA" \
 -XX:ParallelGCThreads=72 \
 -Xms10G -Xmx100G \
 $PROPERTY \
 -jar interproscan-5.jar $@ -u $USER_DIR

```

## Running InterProScan

```
# Make sure you have JAVA installed
sudo apt update
sudo apt install default-jre
java -version

# Create a folder to save the output files
mkdir output

# Run your genome. Information about args can be found at: https://interproscan-docs.readthedocs.io/en/latest/HowToRun.html
bash interproscan.sh -i clean/genomeID.fa --cpu 70 --output-dir output --formats TSV,GFF3 --iprlookup --goterms --pathways
```