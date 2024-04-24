---
layout: page
title: Docking
permalink: /resources/docking
nav_order: 2
parent: Resources
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

# Generative molecular docking

## DiffDock: Deep Confident Steps to New Pockets: Strategies for Docking Generalization

[Paper](https://arxiv.org/abs/2402.18396) | [GitHub](https://github.com/gcorso/DiffDock) | [HuggingFace](https://huggingface.co/spaces/reginabarzilaygroup/DiffDock-Web) | [Docker*](https://hub.docker.com/r/externelly/diffdock)

Fast and easy to use docking method. Requires as little as a protein structure and molecule SMILES to go started. Note that DiffDock was updated in February 2024, with the updated version named DiffDock-L. Additional information about the original version and manuscript can be found in the GitHub repository.

/* I have created the linked DiffDock-L Docker image. You can find detailed instructions in the Docker Hub page.

## DynamicBind: predicting ligand-specific protein-ligand complex structure with a deep equivariant generative model

[Paper](https://www.nature.com/articles/s41467-024-45461-2) | [GitHub](https://github.com/luwei0917/DynamicBind) | HuggingFace | Docker*

A molecular docking method in which both the protein and the ligand are docked in a flexible manner. 

/* I am in the process of creating a Docker image for DynamicBind. Will update shortly. 

## NeuralPLexer: State-specific protein–ligand complex structure prediction with a multiscale deep generative model

As far as I can tell, NeuralPLexer is not available online and is not open-source. I will update this section if it becomes open-source.

[Paper](https://www.nature.com/articles/s42256-024-00792-z) | [GitHub](https://github.com/zrqiao/NeuralPLexer)

# Additional resources

## Reviews

* [The Art and Science of Molecular Docking](https://www.annualreviews.org/content/journals/10.1146/annurev-biochem-030222-120000)
* [Structure-Based Drug Discovery with Deep Learning](https://chemistry-europe.onlinelibrary.wiley.com/doi/full/10.1002/cbic.202200776?casa_token=oFYIbuG_I-YAAAAA%3AHr7AYBASZExKWWLLO0-z03ewE5jifnDzPC-N_yPYYKAiuhObuaOWPnsBQ3Xq2jbUAppJslnRPBY34sTo)

## Collections
* [awesome-molecular-generation](https://github.com/amorehead/awesome-molecular-generation)
* [awesome-molecular-docking](https://github.com/Thinklab-SJTU/awesome-molecular-docking)