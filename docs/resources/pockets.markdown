---
layout: page
title: Pockets
permalink: /resources/Pockets
nav_order: 1
parent: Resources
has_toc: false
---

Pocket detection in protein structures is important for understanding protein function and regulation, and finding possible druggable sites. As such, there are a lot of different packages and online servers that can be used. From my brief survey of published work, it seems to me that many packages either don't work out of the box, do not provide source code or are behind a proprietary academic/commercial licensing. Perhaps even more so when looking at method used protein pocket similarity comparisons. While the list I'm compiling below is not going to be comprehensive, I am going to add some links to reviews that survey the available methods in the field. See my [PlantDiffusion/pockets](https://github.com/eporetsky/PlantDiffusion/tree/main/pockets) GitHub page to find additional instructions and Docker files for running protein pocket prediction and comparison methods. For convenience, the table of content is split into two related sections: (A) protein pocket detection methods and (B) protein pocket similarity comparison methods. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>


# Pocket Detection

## P2Rank

**P2Rank: machine learning based tool for rapid and accurate prediction of ligand binding sites from protein structure**

[Paper](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-018-0285-8){: .btn .btn-purple }
[GitHub](https://github.com/rdk/p2rank){: .btn .btn-blue }
[Webserver](https://academic.oup.com/nar/article/50/W1/W593/6591527){: .btn .btn-green }

Fast and easy to use protein pocket detection method. It took ~2 hours to analyze ~30k PDB files using 12 CPU threads. Includes an online server for detecting and visualizing pockets.

## Fpocket

**Fpocket: an open source platform for ligand pocket detection**

[Paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-168){: .btn .btn-purple }
[GitHub](https://github.com/Discngine/fpocket){: .btn .btn-blue }
[Webserver](https://durrantlab.pitt.edu/fpocketweb){: .btn .btn-green }

fpocket is another tool that I am planning to use for protein pocket prediction in the near future. Also worth checking [MDPocket](https://academic.oup.com/bioinformatics/article/27/23/3276/234086) for tracking pockets in molecular dynamics trajectories. [FPocketWeb](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-022-00637-0) is an online server for detecting and visualizing pockets.

[fpocket webserver](https://pubmed.ncbi.nlm.nih.gov/20478829/) is another online server for detecting and visualizing pockets: <br>
https://bioserv.rpbs.univ-paris-diderot.fr/services/fpocket/

## SiteFerret

**SiteFerret: beyond simple pocket identification in proteins**

[Paper](https://pubs.acs.org/doi/10.1021/acs.jctc.2c01306){: .btn .btn-purple }
[GitHub](https://github.com/concept-lab/SiteFerret){: .btn .btn-blue }

I created a Docker env for SiteFerret but I run into errors when trying to predict pockets on a PDB file. I am not planning on spending more time on this for the time being.

## Ligand Binding Site Detection and Segmentation using 3D Convolutional Neural Networks

**DeepPocket: Ligand Binding Site Detection and Segmentation using 3D Convolutional Neural Networks**

[Paper](https://pubs.acs.org/doi/full/10.1021/acs.jcim.1c00799){: .btn .btn-purple }
[GitHub](https://github.com/devalab/DeepPocket){: .btn .btn-blue }

# Pocket Comparison

## PPS-align

[Paper](){: .btn }
[GitHub](https://pubmed.ncbi.nlm.nih.gov/29462237){: .btn .btn-blue }
[Webserver](https://pubmed.ncbi.nlm.nih.gov/29462237){: .btn .btn-green }

Easy to use, but somewhat slow, pocket similarity comparison method. It seems like PPS-align doesn't have a manuscript at this point and [LS-align](https://pubmed.ncbi.nlm.nih.gov/29462237/) might be alternative paper to cite for the time being. Online web server and source code are available through webserver.

## DeeplyTough

**DeeplyTough: Learning Structural Comparison of Protein Binding Sites**

[Paper](https://pubs.acs.org/doi/full/10.1021/acs.jcim.9b00554){: .btn .btn-purple }
[GitHub](https://github.com/BenevolentAI/DeeplyTough/tree/master){: .btn .btn-blue }

Dockerfile included in the GitHub repository.

## G-LoSA

**G-LoSA: An Efficient Computational Tool for Local Structure-Centric Biological Studies and Drug Design**

[Paper](https://pubmed.ncbi.nlm.nih.gov/26813336){: .btn .btn-purple }
[GitHub](){: .btn }
[Webserver](https://compbio.lehigh.edu/GLoSA){: .btn .btn-green }

## PDBspheres

**PDBspheres: Clustering Protein Binding Pockets and Identifying Potential Drug Interactions: A Novel Ligand-Based Featurization Method**

[Paper](https://pubs.acs.org/doi/10.1021/acs.jcim.3c00722){: .btn .btn-purple }
[GitHub](https://github.com/LLNL/PDBspheres/blob/main/PDBspheres.README_INSTALLATION.txt){: .btn .btn-blue }

## Pocket Similarity: Are α Carbons Enough?

[Manuscript](https://pubs.acs.org/doi/10.1021/ci100210c) | GitHub | Colab | Docker

No source code implementation included for this methods but worth mentioning.

# Pocket-based Molecule Design

## Pocket2Mol

**Pocket2Mol: Efficient Molecular Sampling Based on 3D Protein Pockets**

[Paper](https://arxiv.org/abs/2205.07249){: .btn .btn-purple }
[GitHub](https://github.com/pengxingang/Pocket2Mol){: .btn .btn-blue }
[Colab](https://colab.research.google.com/github/hgbrian/biocolabs/blob/master/Pocket2Mol.ipynb){: .btn .btn-green }

## Additional resources

* [Estimating the Similarity between Protein Pockets](https://www.mdpi.com/1422-0067/23/20/12462)
* [Protein-Ligand Interaction Clusters (PLIC)](https://academic.oup.com/database/article/doi/10.1093/database/bau029/2634082)
* [GHECOM](https://pdbj.org/ghecom/)
* [SiteMine](https://onlinelibrary.wiley.com/doi/10.1002/ardp.202300661)
* [PocketShape](https://onlinelibrary.wiley.com/doi/10.1002/prot.26176)
* [POVME 2.0](https://pubs.acs.org/doi/10.1021/ct500381c)
* [PatchScore](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6644390/)
* [SiteHopper](https://link.springer.com/article/10.1186/1758-2946-6-S1-P57)
* [PocketMatch](https://link.springer.com/article/10.1186/1471-2105-9-543)
* [PickPocket](https://www.biorxiv.org/content/10.1101/2020.04.15.042655v1.full.pdf)
* [Ratar (WIP)](https://volkamerlab.org/projects/ratar/)
* [PocketPipe](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6599441/)
* [CRAFT](https://github.com/PGlab-NIPER/CRAFT/)
* [GrASP](https://pubs.acs.org/doi/10.1021/acs.jcim.3c01698)