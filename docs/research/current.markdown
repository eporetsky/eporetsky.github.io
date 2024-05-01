---
layout: page
title: Current Research
permalink: /research/current
nav_order: 1
parent: Research
has_toc: false
---

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Molecular docking and protein-ligand interactions

Work in progress. You can find some relevant information in my [protein page](https://eporetsky.github.io/bioinformatics/proteins).

## PhosBoost

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/PhosBoost.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

PhosBoost is a machine learning approach that leverages protein language models and gradient boosting trees to predict protein phosphorylation from experimentally derived data. PhosBoost offers improved performance when recall is prioritized while consistently providing more confident probability scores.

[Plant Direct](https://onlinelibrary.wiley.com/doi/full/10.1002/pld3.554){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PhosBoost){: .btn .btn-blue }

<u>Poretsky, E.</u>, Andorf, C. M., & Sen, T. Z. (2023). PhosBoost: Improved phosphorylation prediction recall using gradient boosting and protein language models. Plant Direct, 7(12), e554.


## PanPPI

In the PanPPI framework, we generated predicted STRING-db interactomes for the 26 maize NAM inbred lines and used ClusterONE to cluster the genome-, core-, and pan-interactomes. The clusters were then annotated using GO term enrichment, gene coexpression, and gene descriptions. The annotated clusters can be used putative gene function predictions and prioritization of candidate genes. The framework can be applied to any list of pan-genomes, see the GitHub repository for instructions. We also generated a Python Dash web-application to help with finding relevant PPI clusters with user-provided genes of interest. The easiest way to access the app, with the maize data pre-loaded, is by following the instructions in the provided Docker page ([instructions to install Docker](https://docs.docker.com/engine/install/)). Alternatively, the code and instructions for the Dash app are available in the GitHub repository.

[G3: Genes, Genomes, Genetics](https://academic.oup.com/g3journal/advance-article/doi/10.1093/g3journal/jkae059/7630293){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PanPPI){: .btn .btn-blue }
[Docker](https://hub.docker.com/r/externelly/panppi){: .btn .btn-green }

<u>Poretsky, E.*</u>, Cagirici, H. B.*, Andorf, C. M., & Sen, T. Z. (2024). Harnessing the predicted maize pan-interactome for putative gene function prediction and prioritization of candidate genes for important traits. G3: Genes, Genomes, Genetics, jkae059.