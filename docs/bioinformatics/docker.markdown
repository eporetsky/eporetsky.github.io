---
layout: page
title: Docker Images
permalink: /bioinformatics/docker
nav_order: 2
parent: Bioinformatics
has_toc: false
---

I have been working on creating Docker images for a number of bioinformatics tools that I used on a regular bases. In addition to just having functional Docker images to run different workflows, I am also adding step-by-step instructions on how to access the Docker container and how to generate the input and output files using each tool. If a well-documented Docker image already exists for a bioinformatics tool I use regularly, I'll just add a link in the `Resources` page. Below, you can find instructions on how you can make your own Docker images and brief description of the Docker images I created. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## DiffDock

DiffDock can be used to run molecular docking analyses of specified small molecules and a given protein structure. 

[Docker Hub](https://hub.docker.com/r/externelly/diffdock){: .btn .btn-purple }
[GitHub Dockerfile](https://github.com/eporetsky/workflows/blob/main/Docker/DiffDock/Dockerfile){: .btn .btn-blue }

## AlphaFill

AlphaFill can be used to transplant ligands from experimental structures to predicted structures based on structure similairty. This AlphaFill Docker image can be used to run the stand-alone version of AlphaFill. Additional instructions and details are provided in the Docker Hub page.

[Docker Hub](https://hub.docker.com/r/externelly/alphafill){: .btn .btn-purple }
[GitHub Dockerfile](https://github.com/eporetsky/workflows/blob/main/Docker/AlphaFill/Dockerfile){: .btn .btn-blue }

## P2Rank

[Docker Hub](https://hub.docker.com/r/externelly/p2rank){: .btn .btn-purple }
[GitHub Dockerfile](){: .btn .btn-blue  .disabled }

## PanPPI

A Python Dash web-app that I built to explore the PanPPI data we generated using the maize pan-genomes, as explained in this [G3:Genes\|Genomes\|Genetics](https://academic.oup.com/g3journal/advance-article/doi/10.1093/g3journal/jkae059/7630293) paper. Currently there is only a Docker image for the Dash app with the maize data included, but I am planning to add a Docker image for running the analysis workflow for custom pan-genomes and custom data.

[Docker Hub](https://hub.docker.com/r/externelly/panppi){: .btn .btn-purple }
[GitHub Dockerfile](){: .btn .btn-blue }

## PhylogenyZ

An environment to run simple phylogenetic analyses, meant primarily for building protein trees. The general workflow I use is: (1) protein alignmnet using FAMSA, (2) alignment trimming using ClipKIT, and (3) building the phylogenetic tree using IQ-TREE2.

[Docker Hub](https://hub.docker.com/r/externelly/phylogenyz){: .btn .btn-purple }
[GitHub Dockerfile](){: .btn .btn-blue }

## Chainsaw

An Docker image for running [Chainsaw](https://github.com/JudeWells/chainsaw), a protein domain segmentation based on a given PDB structure. 

[Docker Hub](https://hub.docker.com/r/externelly/chainsaw){: .btn .btn-purple }
[GitHub Dockerfile](https://github.com/eporetsky/workflows/blob/main/Docker/Chainsaw/Dockerfile){: .btn .btn-blue }
