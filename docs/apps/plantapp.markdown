---
layout: page
title: PlantApp
permalink: /apps/PlantApp
nav_order: 1
parent: apps
has_toc: false
---

---

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

## Developing user-friendly data analysis tools

It was in the second half of my PhD that I learned about data analysis apps. I was trying to parse through GWAS results from a maize metabolomic screen, which was made significantly easier when I started using an R Shiny app that was developed for this exact purpose. Later, when trying to a apply a new coexpression analysis method, using Mutual Rank instead of Pearson Correlation Coefficient, I realized that a reactive and customizable R Shiny app would be more efficient than running a short scripts with different paramters every timeI wanted to check a different gene or a different expression data set.   

## MutRank: an R shiny web-application for exploratory targeted mutual rank-based coexpression analyses

[GitHub](https://github.com/eporetsky/MutRank){: .btn .btn-blue }
[Webserver](https://peerj.com/articles/10264/){: .btn .btn-green }

Transcriptomic data can uncover complex biological processes in part through the improved understanding of gene coexpression patterns. Mutual Rank (MR), the geometric mean of the ranked Pearson’s Correlation Coefficient (PCCs) between a pair of genes was shown to be a better indicator of functional associations and produces more robust results when using raw data compared to PCC. MR analyses were shown to be highly effective for identifying highly correlated specialized metabolism pathway genes, serving as springboard for hypothesis testing and validation. I developed MutRank web-app using the R Shiny package, to facilitate user control over both targeted and non-targeted MR-based coexpression analyses for rapid hypothesis testing. In addition to identifying highly coexpressed genes in any user-provided expression dataset, MutRank automatically integrates supporting information such as gene annotations, differential-expression data, predicted domains and assigned GO terms and provides useful tabular and graphical outputs as foundation for empirical hypothesis testing. The goal of MutRank is to provide simple, customizable and readily accessible tools to speed research progress in connecting metabolic phenotypes to genotypes for the purpose of understanding biological roles. More detailed information are available on the MutRank GitHub page and manuscript, linked above.

**Data input menu**
![](../../assets/images/mutrank_screenshot_datainput.png)

**Mutual rank menu**
![](../../assets/images/mutrank_screenshot_mutualrank.png)

## PlantApp.org

[GitHub](https://github.com/eporetsky/PlantApp){: .btn .btn-blue }
[Webserver](https://www.plantapp.org){: .btn .btn-green }

PlantApp is Python Dash-based website that I started working on in 2021 with the goal of creating a protein sequence-centric database for comparative genomics in plants with an easy-to-use interface. I have included more detailed information in the [research/PlantApp page](https://eporetsky.github.io/research/plantapp), and you can follow the links below to the website and to the GitHub page were the code for the website is available.

## syntenyZ

[GitHub](https://github.com/eporetsky/syntenyZ){: .btn .btn-blue }

## blasTree

[GitHub](https://github.com/eporetsky/blasTree){: .btn .btn-blue  .disabled }