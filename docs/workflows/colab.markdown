---
layout: page
title: Colab Notebooks
permalink: /workflows/colab
nav_order: 1
parent: workflows
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

[Paper](https://github.com/eporetsky/PhosBoost){: .btn .btn-purple }
[GitHub](https://onlinelibrary.wiley.com/doi/10.1002/pld3.554){: .btn .btn-blue }

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/img_PhosBoost.png?raw=true){: width="400" }

## AlphaFill-Relax

<a target="_blank" href="https://colab.research.google.com/github/eporetsky/workflows/blob/main/Colab/alphafill_relax.ipynb">
  <img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/>
</a>

A Colab notebook I prepared for running a brief 20ps Molecular Dynamics (MD) equilibration simulation step using OpenMM engine and AMBER force field. My very preliminary results show that it can improve the positioning of metal cofactors in terpene synthase active sites. Additional information can be found in the [bioinformatics/proteins](https://eporetsky.github.io/bioinformatics/proteins) page and inside the notebook.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/animations/alphafill_relax_traj.gif?raw=true){: width="400" }