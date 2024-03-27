---
layout: page
title: Inverse Folding
permalink: /resources/inverse-folding
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

## ProteinMPNN: Robust deep learning–based protein sequence design using ProteinMPNN

[Paper](https://www.science.org/doi/10.1126/science.add2187) | [Github](https://github.com/dauparas/ProteinMPNN) | [Colab](https://colab.research.google.com/github/dauparas/ProteinMPNN/blob/main/colab_notebooks/quickdemo.ipynb) | [HuggingFace](https://huggingface.co/spaces/simonduerr/ProteinMPNN) | Docker | [YouTube](https://www.youtube.com/watch?v=aVQQuoToTJA)

## LigandMPNN: Atomic context-conditioned protein sequence design using LigandMPNN

[Paper](https://www.biorxiv.org/content/10.1101/2023.12.22.573103v1) | [Github](https://github.com/dauparas/LigandMPNN/tree/main) | [Colab](https://colab.research.google.com/github/ullahsamee/ligandMPNN_Colab/blob/main/LigandMPNN_Colab.ipynb) | [Docker]() | [YouTube](https://www.youtube.com/watch?v=LFsxLVqPQho)

## ESM-IF1: A high-level programming language for generative protein design

This model predicts protein sequences from backbone atom coordinates, trained on AF2 predicted structures. The model consists of invariant geometric input processing layers followed by a sequence-to-sequence transformer and can predict sequences for partially masked structures.

[Paper](https://www.biorxiv.org/content/10.1101/2022.12.21.521526v1) | [Github](https://github.com/facebookresearch/esm?tab=readme-ov-file#invf) | [Colab](https://colab.research.google.com/github/facebookresearch/esm/blob/main/examples/inverse_folding/notebook.ipynb) | [Docker]() |

## PiFold: Toward effective and efficient protein inverse folding

[Paper](https://arxiv.org/abs/2209.12643) | [GitHub](https://github.com/A4Bio/PiFold) | [Colab](https://colab.research.google.com/drive/1z6vpKA5L1iAmBLfREbmy8VNOtDYlkY4Q?usp=sharing)

## Knowledge-Design: Pushing the Limit of Protein Design via Knowledge Refinement

[Paper](https://arxiv.org/abs/2305.15151) | GitHub | Colab | Docker

## GraDe_IF: Graph Denoising Diffusion for Inverse Protein Folding

[Paper](https://arxiv.org/abs/2306.16819) | [Github](https://github.com/ykiiiiii/GraDe_IF) | Colab | Docker

## ProRefiner: an entropy-based refining strategy for inverse protein folding with global graph attention

[Paper](https://www.nature.com/articles/s41467-023-43166-6) | [Github](https://github.com/veghen/ProRefiner) | [Colab](https://colab.research.google.com/drive/1a6VW-BB0twEwL65sE_dUAM42wdSm6RZp) | [CodeOcean](https://codeocean.com/capsule/9492154/tree/v2) | Docker

## ProteinInvBench: Benchmarking Protein Inverse Folding on Diverse Tasks, Models, and Metrics

[Paper](https://openreview.net/pdf?id=bqXduvuW5E) | [GitHub](https://github.com/A4Bio/ProteinInvBench) | 