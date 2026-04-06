---
layout: page
title: MutAgg
permalink: /analysis-tools/mutagg
has_toc: false
---

[GitHub — MutAgg](https://github.com/eporetsky/MutAgg){: .btn .btn-purple}

MutAgg runs a Mutual Rank (MR) coexpression pipeline on gene expression matrices and aggregates results across many experiments with a degree-corrected statistical test. It is built for meta-analysis of coexpression: you have multiple RNA-seq studies (e.g. different accessions, tissues, or conditions), each yielding an expression matrix (genes × samples). MutAgg computes MR networks per experiment (or per sample-split when using the optional K-means splitting), then asks which gene pairs are coexpressed more often than expected by chance across experiments, while correcting for the fact that highly connected “hub” genes will share many partners by chance alone.
