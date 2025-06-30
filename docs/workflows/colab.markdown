---
layout: page
title: Colab Notebooks
permalink: /workflows/colab
nav_order: 1
parent: Workflows
has_toc: false
---

I have been working on creating Colab notebooks for a number of bioinformatics projects that I have been working on. 

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

A Colab notebook I prepared for predicting protein phosphorylation sites for a user-provided protein, based on our PhosBoost manuscript. The Colab notebook runs fast on a CPU node, so it should also work with a free account. Additional details can be found in the paper, GitHub repository, and the Colab notebook.

[Paper](https://onlinelibrary.wiley.com/doi/10.1002/pld3.554){: .btn .btn-purple }
[GitHub](https://github.com/eporetsky/PhosBoost){: .btn .btn-blue }

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_PhosBoost.png?raw=true){: width="400" }

## AllMetal3D

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/AllMetal3D.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

## 

A minimal Colab notebook for predicting metal and water binding sites in proteins. Works with CUDA out of the box when running on a GPU node.

[Paper](https://www.biorxiv.org/content/10.1101/2025.02.05.636627v1.abstract){: .btn .btn-purple }
[GitHub](https://github.com/lcbc-epfl/allmetal3d){: .btn .btn-blue }

## AlphaFill-Relax

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/alphafill_relax.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

A Colab notebook I prepared for running a brief 20ps Molecular Dynamics (MD) equilibration simulation step using OpenMM engine and AMBER force field. My very preliminary results show that it can improve the positioning of metal cofactors in terpene synthase active sites. Additional information can be found in the [bioinformatics/proteins](https://eporetsky.github.io/bioinformatics/proteins) page and inside the notebook.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/animations/alphafill_relax_traj.gif?raw=true){: width="400" }

## Relax Amber Batch

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/relax_amber_batch.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

A Colab notebook I prepared for running the amber relaxation step recommended for predicted protein structures. This notebook is based completely on the `relax_amber` notebook that can be found at the [ColabFold](https://github.com/sokrypton/ColabFold) repository. The only addition offered here is the ability to batch-apply the PDB relaxation step to all PDB files in a given Google Drive folder.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_batch_relax.png?raw=true){: width="400" }
