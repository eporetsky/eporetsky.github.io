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

## DiffDock

**DiffDock: Deep Confident Steps to New Pockets: Strategies for Docking Generalization**

[Paper](https://arxiv.org/abs/2402.18396){: .btn .btn-purple }
[GitHub](https://github.com/gcorso/DiffDock){: .btn .btn-blue }
[HuggingFace](https://huggingface.co/spaces/reginabarzilaygroup/DiffDock-Web){: .btn .btn-green }
[>Docker](https://hub.docker.com/r/externelly/diffdock){: .btn .btn-green }

Fast and easy to use docking method. Requires as little as a protein structure and molecule SMILES to go started. Note that DiffDock was updated in February 2024, with the updated version named DiffDock-L. Additional information about the original version and manuscript can be found in the GitHub repository.

> I have created the linked DiffDock-L Docker image. You can find detailed instructions in the Docker Hub page. That said, the official GitHub repository has a Dockerfile to run the webserver DiffDock version. It should be straightforward to have it edited to run DiffDock on the commandline. 

## DynamicBind

**DynamicBind: predicting ligand-specific protein-ligand complex structure with a deep equivariant generative model**

[Paper](https://www.nature.com/articles/s41467-024-45461-2){: .btn .btn-purple }
[GitHub](https://github.com/luwei0917/DynamicBind){: .btn .btn-blue }
[Docker](){: .btn .disabled }

A molecular docking method in which both the protein and the ligand are docked in a flexible manner. 

> I am in the process of creating a Docker image for DynamicBind. Will update shortly. 

## NeuralPLexer

NeuralPLexer: State-specific protein–ligand complex structure prediction with a multiscale deep generative model

[Paper](https://www.nature.com/articles/s42256-024-00792-z){: .btn .btn-purple }
[GitHub](https://github.com/zrqiao/NeuralPLexer){: .btn .btn-blue }

# Physical docking

## OpenBPMD

**Open Binding Pose Metadynamics: An Effective Approach for the Ranking of Protein–Ligand Binding Poses**

[Paper](https://pubs.acs.org/doi/10.1021/acs.jcim.2c01142){: .btn .btn-purple }
[GitHub](https://github.com/Gervasiolab/OpenBPMD){: .btn .btn-blue }

## GNINA

**GNINA 1.0: molecular docking with deep learning**

[Paper](https://jcheminf.biomedcentral.com/articles/10.1186/s13321-021-00522-2){: .btn .btn-purple }
[GitHub](https://github.com/gnina/gnina){: .btn .btn-blue }
[Docker](https://hub.docker.com/r/gnina/gnina){: .btn .btn-green }

## Cloud-Bind

[Paper](#){: .btn .disabled }
[GitHub](https://github.com/pablo-arantes/Cloud-Bind){: .btn .btn-blue }

A repository with a couple of different Colab notebooks for running GNINA (molecular docking program with integrated support for scoring and optimizing ligands using convolutional neural networks), Uni-Dock (GPU-accelerated molecular docking program) and OpenBPMD (evaluating ligand pose stability using metadynamics). 

## hgbrian/biocolabs 

[Paper](#){: .btn .disabled }
[GitHub](https://github.com/hgbrian/biocolabs){: .btn .btn-blue }

A collection of Colab notebooks, including some related to molecular docking.

## DOCKSTRING

**DOCKSTRING: easy molecular docking yields better benchmarks for ligand design**

[Paper](https://arxiv.org/abs/2110.15486) | [Webpage](https://dockstring.github.io/) | [GitHub](https://github.com/dockstring/dockstring)

# Additional resources

## Reviews

* [The Art and Science of Molecular Docking](https://www.annualreviews.org/content/journals/10.1146/annurev-biochem-030222-120000)
* [Structure-Based Drug Discovery with Deep Learning](https://chemistry-europe.onlinelibrary.wiley.com/doi/full/10.1002/cbic.202200776?casa_token=oFYIbuG_I-YAAAAA%3AHr7AYBASZExKWWLLO0-z03ewE5jifnDzPC-N_yPYYKAiuhObuaOWPnsBQ3Xq2jbUAppJslnRPBY34sTo)

## Collections
* [awesome-molecular-generation](https://github.com/amorehead/awesome-molecular-generation)
* [awesome-molecular-docking](https://github.com/Thinklab-SJTU/awesome-molecular-docking)