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

# Introduction to PlantApp

[GitHub](https://github.com/eporetsky/PlantApp){: .btn .btn-blue }
[Webserver](https://www.plantapp.org){: .btn .btn-green }

I started working on [www.plantapp.org](https://www.plantapp.org/) in 2021. My goal was to build a protein sequence-centric database (but not only) for comparative genomics in plants with an easy-to-use interface. As a starting point, I focused on the Phytozome primary protein sequences for individual plant genomes. You can find which datasets are currently on available on PlantApp through [this link](https://www.plantapp.org/SQNce/available_dbs/). I haven't spend much time since starting my SCINet Post-doc position at USDA in 2023, but I am happy to add more genomes and features, upon request. Feel free to reach out by email, Mastodon, LinkedIn, or open an issue on the [PlantApp GitHub page](https://github.com/eporetsky/PlantApp).

# The SQNce database

I created a very simple SQLite database, named SQNce, to store all the data being used by PlantApp. The database can be parsed on the website. The current avaialble inforamtion includes protein annotations, sequences, orthogroups, best-blast-hits, genomic coordiantes, and some gene expression data.

# PlantApp apps

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