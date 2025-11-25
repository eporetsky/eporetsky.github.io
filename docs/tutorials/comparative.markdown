---
layout: page
title: Commparative Genomics
permalink: /tutorials/comparative
nav_order: 9
parent: Tutorials
has_toc: false
---

This section includes notes and code for comparative genomics analyses.

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Phylogeny

## Fold-Tree

[Paper](https://www.nature.com/articles/s41594-025-01649-8){: .btn .btn-purple }
[GitHub](https://github.com/DessimozLab/fold_tree){: .btn .btn-blue }

First, let's create a conda environment to run `Proteinortho`:

```
git clone https://github.com/DessimozLab/fold_tree.git
cd fold_tree
conda env create -n foldtree --file=workflow/config/foldtree.yaml
conda activate foldtree
```

Brief instructions on how to run the analysis on a custom set of proteins:

Make a `myfam` project directory:
```
mkdir myfam
```

Inside of `myfam` create a `sequence_dataset.csv` file:
```
gene_id1.pdb
gene_id2.pdb
...
gene_idN.pdb
```

Finally, run the `snamemake` workflow:
```
snakemake --cores 16 --use-conda -s workflow/fold_tree --config folder=myfam filter=False foldseek_cores=16 custom_structs=True
```


