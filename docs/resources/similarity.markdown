---
layout: page
title: Protein Similarity
permalink: /resources/protein-similarity
nav_order: 5
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

# Structure-based

## FoldSeek

**Fast and accurate protein structure search with Foldseek**

[Paper](https://www.nature.com/articles/s41587-023-01773-0){: .btn .btn-purple }
[GitHub](https://github.com/steineggerlab/foldseek){: .btn .btn-blue }
[Webserver](https://search.foldseek.com/search){: .btn .btn-green }

## Progres

**Fast protein structure searching using structure graph embeddings**

[Paper](https://www.biorxiv.org/content/10.1101/2022.11.28.518224v2){: .btn .btn-purple }
[GitHub](https://github.com/greener-group/progres){: .btn .btn-blue }

Generally speaking, averaging protein embedding vectors over a whole protein can lead to biases and a substential loss of information. This is, in part, because most proteins are composed of multiple domains and disordered regions that are subject to changes during evolution. Progres uses individual domains as query structures, that can be obtained using tools such as Merizo, SWORD2 and Chainsaw. The protein structure embeddings Progres uses for protein domain similarity search are based on a trained graph neural network using supervised contrastive learning to learn a low-dimensional embedding of protein structure.

# Protein Language Model-based

## PROST

**Improved global protein homolog detection with major gains in function identification**

[Paper](https://www.pnas.org/doi/10.1073/pnas.2211823120){: .btn .btn-purple }
[GitHub](https://github.com/mesihk/prost){: .btn .btn-blue }
[Webserver](https://mesihk.github.io/prost){: .btn .btn-green }

## PLMSearch

**PLMSearch: Protein language model powers accurate and fast sequence search for remote homology**

[Paper](https://www.nature.com/articles/s41467-024-46808-5){: .btn .btn-purple }
[GitHub](https://github.com/maovshao/PLMSearch/tree/main){: .btn .btn-blue }
[PLMSearch](https://dmiip.sjtu.edu.cn/PLMSearch){: .btn .btn-green }
[PLMAlign](https://dmiip.sjtu.edu.cn/PLMAlign){: .btn .btn-green }

# Additional resources

