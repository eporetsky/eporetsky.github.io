---
layout: page
title: PlantApp
permalink: /plantapp/
redirect_from:
  - /research/plantapp
  - /research/plantapp/
has_toc: false
---

[Open PlantApp.org](https://www.plantapp.org){: .btn .btn-green}

PlantApp is a gene- and protein-centric portal for **comparative genomics in plants**. It brings together curated and reprocessed annotation layers—protein descriptions, families, orthogroups, domains, coordinates, and cross-genome links—so you can move from a single identifier to functional context across species without juggling half a dozen portals.

The site has grown substantially since the first public version: expanded genomes and annotation builds, richer expression and coexpression views built on large reprocessed RNA-seq compendia, and lightweight **in-browser tools** (phylogeny sketches, alignments, genome context, GO enrichment, heatmaps, and more) for quick hypothesis checks before you commit to a heavy pipeline.

## What you can explore

- **Annotation stacks** for many plant genomes, with consistent identifiers and summaries you can compare side by side. Current dataset coverage is listed on the live site ([available databases](https://www.plantapp.org/SQNce/available_dbs/)).
- **Expression & coexpression**: interactive plots and downloads for normalized expression data across large sample collections; differential expression and mutual-rank–style coexpression views to support pathway and network thinking.
- **Downstream resources**: links from genes to reprocessed tables, and integration with tools described under **Analysis Tools** (for example coexpression clustering and GRN-style summaries developed for PlantApp).

If you use PlantApp in a publication or talk, please cite the live resource ([plantapp.org](https://www.plantapp.org)) and check the site for the most current attribution text.

## Screenshots (selected)

### Annotation summaries

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_annotations_descriptions.png?raw=true){: width="600" }

### Expression profile

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_expression.png?raw=true){: width="600" }

### Expression heatmap

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_heatmap.png?raw=true){: width="600" }

### Mutual rank–based coexpression view

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_mutualrank.png?raw=true){: width="600" }

## In-browser apps (examples)

### SimpleTree

Build a quick protein-based phylogenetic tree from a list of gene IDs (example data built in).

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_tree.jpg?raw=true){: width="600" }

### Protein alignment

Interactive alignment from selected gene IDs.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_alignment.jpg?raw=true){: width="600" }

### Genome graph

Chromosome-scale context for selected genes (species coverage depends on genome builds in the database).

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_genomegraph.jpg?raw=true){: width="600" }

### GO enrichment

Fast enrichment from a pasted gene list.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_goenrichment.jpg?raw=true){: width="600" }

### Mini-heatmaps

Compact heatmaps for arbitrary gene sets (MapMan-style workflow); paste a matrix or use the built-in example.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/apps_plots_miniheatmap.png?raw=true){: width="600" }
