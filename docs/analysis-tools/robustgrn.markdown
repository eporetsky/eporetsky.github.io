---
layout: page
title: RobustGRN
permalink: /analysis-tools/robustgrn
has_toc: false
---

[GitHub — RobustGRN](https://github.com/eporetsky/robustgrn){: .btn .btn-purple}

**RobustGRN** builds **gene regulatory network (GRN)–style edge lists** from RNA-seq by (1) computing **Mutual Rank (MR)** coexpression from CPM tables with **[MutClust](https://github.com/eporetsky/mutclust)**, then (2) for each transcription factor, **aggregating** ranked partner genes across experiments with **[PyRRA](https://github.com/eporetsky/pyrra)** (Robust Rank Aggregation), applying **per-TF FDR**, and writing a filtered `tf`, `target`, `p`, `adj` table. It is intended as **meta-analysis GRN inference** on MR networks, not as a drop-in replacement for experimentally validated GRN methods.

The pipeline was developed for **[PlantApp](https://www.plantapp.org/)** GRN-style summaries. **Important:** RobustGRN is **experimental**—not benchmarked against other GRN tools or gold-standard assays (e.g. ChIP-seq, perturbations)—and **coexpression does not imply direct regulation**. There is **no plan for further active development**; use it for exploration at your own discretion. Data layout, `robustgrn.py` options, and requirements are documented in the [RobustGRN repository](https://github.com/eporetsky/robustgrn).
