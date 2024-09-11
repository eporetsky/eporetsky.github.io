---
layout: page
title: PlantApp
permalink: /research/plantapp
nav_order: 3
parent: Research
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

---

# What is PlnatApp.org

[PlantApp.org](https://www.plantapp.org){: .btn .btn-green }

I started working on [www.plantapp.org](https://www.plantapp.org/) in 2021. My goal was to build a protein sequence-centric database (but not only) for comparative genomics in plants with an easy-to-use interface. As a starting point, I focused on using the primary protein sequences that are curated by the JGI Phytozome plant genome database. I am in the process of updating the database to include an even more comprehensive set of protein annotations, gene familes, sequences, orthogroups, best-blast-hits and genomic coordiantes. You can find which datasets are currently on available on PlantApp through [this link](https://www.plantapp.org/SQNce/available_dbs/). 


More recently, I have been putting together a large amount of re-analyzed transcriptomic data. Currently, there is CPM data for over 2,000 RNA-seq samples from 7 plant species. The data can be visualized through different interactive figures and the raw count and CPM data is available for downloadmore. 

# Annotations

The PlantApp database contains different types of protein annotations across multiple plant genomes. 

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_annotations_descriptions.png?raw=true){: width="600" }

# Profiles

## Gene expression plot

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_expression.png?raw=true){: width="600" }

## Gene expression heatmap

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_heatmap.png?raw=true){: width="600" }

## Mutual Rank-based coexpression

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_profiles_mutualrank.png?raw=true){: width="600" }

# Apps

More information about the different apps will be provided in the future through the following link:

[App Details](https://eporetsky.github.io/apps/PlantApp){: .btn .btn-blue }

## SimpleTree

Build a simple protein-based phylogenetic tree from a list of gene IDs. Press the example button to see how it works.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_tree.jpg?raw=true){: width="600" }

## Protein Alignment

Generate a simple and interactive protein alignment from a list of selected gene IDs. The genome graph is generated using a Dash app. Press the example button to see how it works.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_alignment.jpg?raw=true){: width="600" }

## Genome Graph

Build a simple genome graph showing the location of selected genes across the genomes. The genome graph is generated using BioPython, and currently only supports Arabidopsis and Maize, although adding support to more genomes is simple. Press the example button to see how it works.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_genomegraph.jpg?raw=true){: width="600" }

## GO Enrichment

Run a quick and simple GO enrichment analysis from a list of selected gene IDs. Press the example button to see how it works.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/plantapp_goenrichment.jpg?raw=true){: width="600" }

## Mini-heatmaps

The mini-heatmaps plotting app was inspired by the gene pathway and gene family heatmap visualization produced by MapMan. This can be useful for visualizing quantitative changes in any group of genes. I used an sns heatmap and then added a rectangle to cover empty cells. Although it works fine, if I had the time, I would re-write to just draw the individual rectangle to make a cleaner figures. Press the "Copy example" button and paste the example data into the text box to get the mini-heatmap. Replacing numerical values with NaN will color the cells white.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/images/apps_plots_miniheatmap.png?raw=true){: width="600" }