---
layout: page
title: Protein Design
permalink: /resources/design
nav_order: 3
parent: Resources
has_toc: false
---

Generally speaking, inverse folding models are built for predicting protein sequences from protein backbones. While it is often used as part of a protein design pipeline to generate multiple sequences for designed binders, their probabilistic nature makes them attractive for a variety of tasks, such as predicting the effect of residue substitutions.

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Methods

## ProteinMPNN

**ProteinMPNN: Robust deep learning–based protein sequence design using ProteinMPNN**

[Paper](https://www.science.org/doi/10.1126/science.add2187){: .btn .btn-purple }
[GitHub](https://github.com/dauparas/ProteinMPNN){: .btn .btn-blue }
[Colab](https://colab.research.google.com/github/dauparas/ProteinMPNN/blob/main/colab_notebooks/quickdemo.ipynb){: .btn .btn-green }
[HuggingFace](https://huggingface.co/spaces/simonduerr/ProteinMPNN){: .btn .btn-green }
[YouTube](https://www.youtube.com/watch?v=aVQQuoToTJA){: .btn .btn-red }


## LigandMPNN

**LigandMPNN: Atomic context-conditioned protein sequence design using LigandMPNN**

[Paper](https://www.biorxiv.org/content/10.1101/2023.12.22.573103v1){: .btn .btn-purple }
[GitHub](https://github.com/dauparas/LigandMPNN){: .btn .btn-blue }
[Colab](https://colab.research.google.com/github/ullahsamee/ligandMPNN_Colab/blob/main/LigandMPNN_Colab.ipynb){: .btn .btn-green }
[YouTube](https://www.youtube.com/watch?v=LFsxLVqPQho){: .btn .btn-red }

## ESM-IF1

**ESM-IF1: A high-level programming language for generative protein design**

[Paper](https://www.biorxiv.org/content/10.1101/2022.12.21.521526v1){: .btn .btn-purple }
[GitHub](https://github.com/facebookresearch/esm?tab=readme-ov-file#invf){: .btn .btn-blue }
[Colab](https://colab.research.google.com/github/facebookresearch/esm/blob/main/examples/inverse_folding/notebook.ipynb){: .btn .btn-green }

This model predicts protein sequences from backbone atom coordinates, trained on AF2 predicted structures. The model consists of invariant geometric input processing layers followed by a sequence-to-sequence transformer and can predict sequences for partially masked structures.

## PiFold

**PiFold: Toward effective and efficient protein inverse folding**

[Paper](https://arxiv.org/abs/2209.12643){: .btn .btn-purple }
[GitHub](https://github.com/A4Bio/PiFold){: .btn .btn-blue }
[Colab](https://colab.research.google.com/drive/1z6vpKA5L1iAmBLfREbmy8VNOtDYlkY4Q?usp=sharing){: .btn .btn-green }


## GraDe_IF

**GraDe_IF: Graph Denoising Diffusion for Inverse Protein Folding**

[Paper](https://arxiv.org/abs/2306.16819){: .btn .btn-purple }
[GitHub](https://github.com/ykiiiiii/GraDe_IF){: .btn .btn-blue }

## ProRefiner

**ProRefiner: an entropy-based refining strategy for inverse protein folding with global graph attention**

[Paper](https://www.nature.com/articles/s41467-023-43166-6){: .btn .btn-purple }
[GitHub](https://github.com/veghen/ProRefiner){: .btn .btn-blue }
[Colab](https://colab.research.google.com/drive/1a6VW-BB0twEwL65sE_dUAM42wdSm6RZp){: .btn .btn-green }
[Colab](https://codeocean.com/capsule/9492154/tree/v2){: .btn .btn-green }

## Protein Structure and Sequence Generation with Equivariant Denoising Diffusion Probabilistic Models

[Paper](https://arxiv.org/pdf/2205.15019.pdf){: .btn .btn-purple }
[GitHub](https://nanand2.github.io/proteins){: .btn .btn-blue }
[YouTube](https://www.youtube.com/watch?v=i8fGzddGbU8){: .btn .btn-red }

# Benchmarks

## ProteinInvBench

**ProteinInvBench: Benchmarking Protein Inverse Folding on Diverse Tasks, Models, and Metrics**

[Paper](https://openreview.net/pdf?id=bqXduvuW5E){: .btn .btn-purple }
[GitHub](https://github.com/A4Bio/ProteinInvBench){: .btn .btn-blue }
  
# Additional resources

* [Knowledge-Design](https://arxiv.org/abs/2305.15151): Pushing the Limit of Protein Design via Knowledge Refinement