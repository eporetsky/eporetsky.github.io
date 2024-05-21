---
layout: page
title: Research
permalink: /research/
nav_order: 2
has_children: true
has_toc: false
---

# General research interests

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Developing ML models: Learning from protein language models (PLMs) and predicted structures 

Protein phosphorylation is a post-translational modification that can alter the structure and function of proteins. PhosBoost is a machine learning approach that leverages protein language models and gradient boosting trees to predict protein phosphorylation from experimentally derived data. PhosBoost offers improved performance when recall is prioritized while consistently providing more confident probability scores. Additional details are available on the [research/current page](https://eporetsky.github.io/research/current).

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_PhosBoost.png?raw=true){: width="400" }

## Developing workflows: Pan-genome protein-protein interaction networks

We deployed the PPI clustering algorithm ClusterONE to identify numerous predicted-PPI clusters that were functionally annotated using gene ontology (GO) functional enrichment, demonstrating a diverse range of enriched GO terms across different clusters. We show that the functionally annotated PPI clusters establish a useful framework for protein function prediction and prioritization of candidate genes of interest. Additional details are available on the [research/current page](https://eporetsky.github.io/research/current).

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_PanPPI.png?raw=true){: width="400" }

## Analysis of protein-ligand interactions: Molecular docking and dynamic simulations

Using predicted protein structures of metabolomic enzymes with generative molecular docking is a powerful tool for understanding substrate specificity and promescuity that enables the metabolomic diversity observed in plants. As part of my PhD and postdoc [research at UCSD](https://eporetsky.github.io/research/ucsd), I have contributed to multiple projects on maize specialized terpenoid antibiotic metabolies and led a project on understanding the biological role of root secreted sesquiterpenoid maize specialized metabolites. One of the interesting patterns that emerged from these research projects is the product promiscuity of some of the discovered terpene synthases (TPSs) and CYP450s. My current postdoc position at USDA, working on SOTA protein structure prediction and molecular docking methods, has sparked my interest in applying these methods to [protein-ligand interactions](https://eporetsky.github.io/research/protein_ligand) in the context of plant specialized metabolism. 

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_enzyme_ligand.png?raw=true){: width="400" }

## Transcriptomic and gene coexpression analyses for metabolomic pathway discovery and understanding ligand-induced signaling

Transcriptional reprogramming is one of the major initial rapid cellular changes that plant cells undergo in response to changing environmental cues and stress signals. For example, using ligand-induced differential gene expression (DGE), we have shown that maize responses to anti-herbivory peptide hormones and exogenous molecules from feeding caterpillar oral secretions induce highly overlapping transcription reprogramming responses, differing primarily in magnitude, rather than uniqueness. This observations suggest that maize immune responses against caterpillars are likely to be highly tuned and initiated through similar signaling pathways. Additional details can be found on the [research/UCSD page](https://eporetsky.github.io/research/ucsd) In addition to DGE analyses, I have have contributed to a number of collaborations studying maize specialized metabolism pathways using gene coexpression analyses. Specialized metabolism enzymes, including in plants, tend to be highly coregulated on the transcriptmic and proteomic level. We found that integrating gene coexpression analyses with forward genetic screens, such as QTL and GWAS mapping, can be used effectively to elucidate almost complete biosynthetic pathways. This part has lead to the development of [MutRank](https://github.com/eporetsky/mutrank), an R Shiny web-app, that greatly facilitates gene coexpression analyses. As part of the hypothesis generation process, I have processed hundreds of publicly available RNA-seq NGS samples, primaily from maize but not restricted to it, using an automated [Snakemake workflow](https://eporetsky.github.io/bioinformatics/snakemade) I developed to automate this process.

![](https://github.com/eporetsky/MutRank/raw/master/img/screenshot_network.png?raw=true){: width="400" }

## Metabolomic profiling of plant tissues: From extraction to multi-omic data analyses

Plant specialized metabolites play important roles in mediating beneficial interaction with microbes and insects and preventing damage from pests and disease. Extraction and profiling of plant metabolites is vital for untangling the basis for these complex ecological and agronomical interactions.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_metabolomics.png?raw=true){: width="400" }

## Association mapping: Discovering the genetic basis for plant phenotypic diversity 

Connecting traits to causal genes through association studies can accelarate translational research and gain insights into the underlying biological processes.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_GWAS.png?raw=true){: width="400" }

## Comparative genomic: Unraveling complex patterns of duplications, deletions, and mutations in syntenic loci

Comparative genomics and phylogenemocs approaches are useful for understanding complex gene duplication, deletion and rearrangement patterns. A better understanind of these events can shed a light on gene expression regulation and neofunctionalization across the genetic diversity of plants. 

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_comparative_genomics.png?raw=true){: width="400" }