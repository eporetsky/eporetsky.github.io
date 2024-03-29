---
layout: page
title: Pockets
permalink: /resources/Pockets
nav_order: 1
parent: Resources
has_toc: false
---

Pocket detection in protein structures is important for understanding protein function and regulation, and finding possible druggable sites. As such, there are a lot of different packages and online servers that can be used. From my brief survey of published work, it seems to me that many packages either don't work out of the box, do not provide source code or are behind a proprietary academic/commercial licensing. Perhaps even more so when looking at method used protein pocket similarity comparisons. While the list I'm compiling below is not going to be comprehensive, I am going to add some links to reviews that survey the available methods in the field. See my [PlantDiffucion/pockets](https://github.com/eporetsky/PlantDiffusion/tree/main/pockets) GitHub page to find additional instructions and Docker files for running protein pocket prediction and comparison methods. For convenience, the table of content is split into two related sections: (A) protein pocket detection methods and (B) protein pocket similarity comparison methods. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>


# Pocket Detection

## P2Rank: machine learning based tool for rapid and accurate prediction of ligand binding sites from protein structure

[Paper](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-018-0285-8) | [GitHub](https://github.com/rdk/p2rank) | [Webserver](https://academic.oup.com/nar/article/50/W1/W593/6591527?login=false) | Colab | Docker

Fast and easy to use protein pocket detection method. It took ~2 hours to analyze ~30k PDB files using 12 CPU threads. Includes an online server for detecting and visualizing pockets.

## fpocket: Fpocket: an open source platform for ligand pocket detection

[Paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-10-168) | [GitHub](https://github.com/Discngine/fpocket) | [Webserver](https://durrantlab.pitt.edu/fpocketweb/) | Colab | Docker

fpocket is another tool that I am planning to use for protein pocket prediction in the near future. Also worth checking [MDPocket](https://academic.oup.com/bioinformatics/article/27/23/3276/234086) for tracking pockets in molecular dynamics trajectories. [FPocketWeb](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-022-00637-0) is an online server for detecting and visualizing pockets.

[fpocket webserver](https://pubmed.ncbi.nlm.nih.gov/20478829/) is another online server for detecting and visualizing pockets: <br>
https://bioserv.rpbs.univ-paris-diderot.fr/services/fpocket/

## SiteFerret: beyond simple pocket identification in proteins

[Paper](https://pubs.acs.org/doi/10.1021/acs.jctc.2c01306) | [GitHub](https://github.com/concept-lab/SiteFerret) | Colab | Docker

I created a Docker env for SiteFerret but I run into errors when trying to predict pockets on a PDB file. I am not planning on spending more time on this for the time being.

# Pocket Comparison

## PPS-align

[Paper](https://pubmed.ncbi.nlm.nih.gov/29462237/) | GitHub | [WebServer](https://zhanggroup.org/PPS-align/)

Easy to use, but somewhat slow, pocket similarity comparison method. It seems like PPS-align doesn't have a manuscript at this point and [LS-align](https://pubmed.ncbi.nlm.nih.gov/29462237/) might be alternative paper to cite for the time being. Online web server and source code are available through webserver.


## PDBspheres: Clustering Protein Binding Pockets and Identifying Potential Drug Interactions: A Novel Ligand-Based Featurization Method

[Paper](https://pubs.acs.org/doi/10.1021/acs.jcim.3c00722/) | [GitHub](https://github.com/LLNL/PDBspheres/blob/main/PDBspheres.README_INSTALLATION.txt) | Colab | Docker

I did not try this one but it looks interesting.

## Pocket Similarity: Are α Carbons Enough?

[Manuscript](https://pubs.acs.org/doi/10.1021/ci100210c) | GitHub | Colab | Docker

No source code implementation included for this methods but worth mentioning.

# Reviews

## Estimating the Similarity between Protein Pockets 

[Paper](https://www.mdpi.com/1422-0067/23/20/12462) |

## Get back to:

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