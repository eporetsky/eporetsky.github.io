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


## ProteinMPNN

Fast and easy to use docking method. Requires as little as a protein structure and molecule SMILES to go started.

https://arxiv.org/pdf/2210.01776.pdf

Easy to use HuggingFace implementation: <br>
https://huggingface.co/spaces/simonduerr/ProteinMPNN

Can also run it on a Google colab notebook: <br>
https://colab.research.google.com/github/dauparas/ProteinMPNN/blob/main/colab_notebooks/quickdemo.ipynb

Predict new sequences using ProteinMPNN and predict structures using ESMFold for aligment with original structure: <br>
https://huggingface.co/spaces/simonduerr/ProteinMPNNESM

## ESM-IF1

This model predicts protein sequences from backbone atom coordinates, trained on AF2 predicted structures. The model consists of invariant geometric input processing layers followed by a sequence-to-sequence transformer and can predict sequences for partially masked structures.

Run it on a Google colab notebook: <br>
https://colab.research.google.com/github/facebookresearch/esm/blob/main/examples/inverse_folding/notebook.ipynb

## Get back to:

* [LigandMPNN](https://www.biorxiv.org/content/10.1101/2023.12.22.573103v1)