---
layout: page
title: MutClust
permalink: /analysis-tools/mutclust
has_toc: false
---

[GitHub — MutClust](https://github.com/eporetsky/mutclust){: .btn .btn-purple}
[PyPI](https://pypi.org/project/MutClust/){: .btn .btn-blue}

**MutClust** is a Python tool for efficient, scalable **mutual rank (MR)–based gene coexpression** analysis. It computes MR from Pearson correlations on a genes × samples expression matrix, then **clusters** genes by calling **ClusterONE** on filtered and weighted MR networks (as in Wisecaver *et al.*, 2017). The CLI is split into two steps—`mutclust mr` to write gzipped MR pair tables (`Gene1`, `Gene2`, `MR`) and `mutclust cls` to produce cluster assignments—using multithreading and sparse matrix code so large datasets stay practical.

MutClust is still under development. Install (`pip` / conda), full option tables, example commands, and the Linux / **pynetcor** dependency note are on the [MutClust repository](https://github.com/eporetsky/mutclust).
