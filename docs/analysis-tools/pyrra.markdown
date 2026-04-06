---
layout: page
title: PyRRA
permalink: /analysis-tools/pyrra
has_toc: false
---

[GitHub — PyRRA](https://github.com/eporetsky/pyrra){: .btn .btn-purple}
[PyPI](https://pypi.org/project/pyrra/){: .btn .btn-blue}

**PyRRA** (Python Robust Rank Aggregation) is a Python implementation of **Robust Rank Aggregation** from the **RobustRankAggreg** R package. RRA is meant to **aggregate ranked lists** when lists can be partial or non-overlapping—typical in meta-analysis, gene list integration, and combining ranked outputs across studies. PyRRA exposes `rank_matrix` and `aggregate_ranks`, ports RRA pieces such as `betaScores` and `rhoScores`, and supports the same aggregation modes as the R package (**RRA**, **stuart**, **mean**, **min**, **median**, **geom.mean**), with helpers for thresholding, multiple testing, and Stuart *p*-values.

PyRRA is **still under development**. It is an **independent** reimplementation; outputs are **not guaranteed** to match RobustRankAggreg R line-for-line, though the repo includes cross-language checks against R. The original method is described in the [RobustRankAggreg](https://doi.org/10.1093/bioinformatics/btr709) paper. Install (`pip install pyrra` or conda), API details, and the comparison workflow live in the [PyRRA repository](https://github.com/eporetsky/pyrra).
