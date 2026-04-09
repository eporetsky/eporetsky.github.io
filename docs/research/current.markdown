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

## PhosBoost

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/PhosBoost.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

PhosBoost is a machine learning approach that leverages protein language models and gradient boosting trees to predict protein phosphorylation from experimentally derived data. PhosBoost offers improved performance when recall is prioritized while consistently providing more confident probability scores.

![](/assets/images/phosboost_fig1.png){: width="380" style="max-width:100%; height:auto;" }

[Plant Direct](https://onlinelibrary.wiley.com/doi/full/10.1002/pld3.554){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PhosBoost){: .btn .btn-blue }

<u>Poretsky, E.</u>, Andorf, C. M., & Sen, T. Z. (2023). PhosBoost: Improved phosphorylation prediction recall using gradient boosting and protein language models. Plant Direct, 7(12), e554.


## PanPPI

In the PanPPI framework, we generated predicted STRING-db interactomes for the 26 maize NAM inbred lines and used ClusterONE to cluster the genome-, core-, and pan-interactomes. The clusters were then annotated using GO term enrichment, gene coexpression, and gene descriptions. The annotated clusters can be used putative gene function predictions and prioritization of candidate genes. The framework can be applied to any list of pan-genomes, see the GitHub repository for instructions. We also generated a Python Dash web-application to help with finding relevant PPI clusters with user-provided genes of interest. The easiest way to access the app, with the maize data pre-loaded, is by following the instructions in the provided Docker page ([instructions to install Docker](https://docs.docker.com/engine/install/)). Alternatively, the code and instructions for the Dash app are available in the GitHub repository.

[G3: Genes, Genomes, Genetics](https://academic.oup.com/g3journal/advance-article/doi/10.1093/g3journal/jkae059/7630293){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PanPPI){: .btn .btn-blue }
[Docker](https://hub.docker.com/r/externelly/panppi){: .btn .btn-green }

<u>Poretsky, E.*</u>, Cagirici, H. B.*, Andorf, C. M., & Sen, T. Z. (2024). Harnessing the predicted maize pan-interactome for putative gene function prediction and prioritization of candidate genes for important traits. G3: Genes, Genomes, Genetics, jkae059.

## Structural Variability of Pfam Domains

This work combines AlphaFold2-predicted structures with Pfam domain annotations to characterize structural variability within domain families. The [PfamFold](https://github.com/eporetsky/PfamFold) workflow extracts domain coordinates, computes structural features, and uses FoldSeek together with agglomerative clustering to group similar domain conformations—useful for interpreting domain diversity and for curation of Pfam families.

![](/assets/images/pfam_fig1.png){: width="380" style="max-width:100%; height:auto;" }

[Proteins](https://onlinelibrary.wiley.com/doi/full/10.1002/prot.70021){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PfamFold){: .btn .btn-blue }

<u>Poretsky, E.</u>, Andorf, C. M., & Sen, T. Z. (2025). Structural variability of Pfam domains based on Alphafold2 predictions. Proteins, 93(12), 2182–2192.

## LLMs in Biocuration

Large language models (LLMs) can help extract structured information from the scientific literature, but their accuracy must be measured against expert curation. In the ChatMTA project we compared GPT-3.5 and GPT-4 to a professional curator on wheat and barley genetic mapping papers, using a retrieval-augmented QA setup to probe traits and QTLs. The study highlights where LLMs are already useful for biocuration workflows—and where human review remains essential.

[Database](https://academic.oup.com/database/article/doi/10.1093/database/baaf011/8019548){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/ChatMTA){: .btn .btn-blue }

<u>Poretsky, E.*</u>, Blake, V. C., Andorf, C. M., & Sen, T. Z. (2025). Assessing the performance of generative artificial intelligence in retrieving information against manually curated genetic and genomic data. Database, 2025, baaf011.

## Ligand Docking

[LiganDock](https://github.com/eporetsky/LiganDock) is a Python toolkit for automated receptor and ligand preparation, flexible grid-box definition (marker ligand, selected residues, or PyKVFinder pockets), and batch docking with AutoDock Vina—wired to Meeko, RDKit, OpenBabel, and related tools. I am still interested in applying docking and related structure-based methods (including approaches such as DiffDock and DynamicBind) to predicted plant specialized metabolism enzymes, especially terpene synthases. Related notes and resources also appear on the [protein-ligand page](https://eporetsky.github.io/bioinformatics/protein_ligand).

[GitHub](https://github.com/eporetsky/LiganDock){: .btn .btn-blue }
