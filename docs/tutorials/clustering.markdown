---
layout: page
title: Clustering Analysis
permalink: /tutorials/clustering
nav_order: 8
parent: Tutorials
has_toc: false
---

This section includes code for processing and analyzing gene coexpression data. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Clustering analysis

## Introduction

This section is a work in progress. Here, we will provide an overview of clustering analysis methods and their applications, with a focus on gene coexpression studies. More detailed explanations and examples will be added soon.

## Enrichment analysis

This section demonstrates how to perform a simple enrichment analysis on gene clusters using a custom gene set. The provided code allows you to test whether any of your identified clusters are significantly enriched for a specific list of genes, such as WRKY transcription factors or any other gene set of interest. 

The approach uses the hypergeometric test to assess the statistical significance of the overlap between each cluster and your custom gene set. Importantly, the universe of genes considered in this analysis is limited to the genes present in your clusters (i.e., those included in your clustering results), rather than all genes or proteins encoded in the genome. This makes the enrichment results specific to your dataset and avoids biases that could arise from including genes not represented in your clusters.

You can use this workflow by providing your own cluster assignments (in a file like `clusters.tsv`) and your gene set of interest (in a file like `custom_term.tsv`). The output will indicate which clusters, if any, are significantly enriched for your gene set, along with fold enrichment and FDR-corrected p-values.

```
import pandas as pd
from scipy.stats import hypergeom
from statsmodels.stats.multitest import multipletests

# argument gene_sets accept dict input
# This is useful when define your own gene_sets
custom_term = pd.read_csv("custom_term.tsv", sep="\t", encoding="ISO-8859-1")["gene_id"].tolist()

# Gene IDs are in 'gene_id' column and cluste IDs are in 'cluster' column
gene_clusters = pd.read_csv("clusters.tsv", sep="\t")

# List of all genes included in the analysis
all_genes = gene_clusters["gene_id"].tolist()

# Prepare cluster enrichment results
results = []
for cluster_id in gene_clusters["cluster"].unique():
    cluster_genes = gene_clusters[gene_clusters["cluster"] == cluster_id]["gene_id"].tolist()
    # Overlap between cluster and custom gene set
    overlap = set(cluster_genes) & set(custom_term)
    k = len(overlap)  # overlap in cluster
    M = len(all_genes)  # total genes
    n = len(custom_term)  # total custom genes
    N = len(cluster_genes)  # genes in cluster
    # Hypergeometric test: P(X >= k)
    pval = hypergeom.sf(k-1, M, n, N)
    # Fold enrichment: (observed/expected)
    expected = N * n / M if M > 0 else 0
    fold_enrichment = (k / expected) if expected > 0 else float('inf')
    results.append({
        "cluster": cluster_id,
        "cluster_size": N,
        "overlap": k,
        "pval": pval,
        "fold_enrichment": fold_enrichment,
        "overlap_genes": list(overlap)
    })

# Convert to DataFrame
results_df = pd.DataFrame(results)
# FDR correction
results_df["fdr"] = multipletests(results_df["pval"], method="fdr_bh")[1]
# Reorder columns: cluster, cluster_size, overlap, pval, fdr, fold_enrichment, overlap_genes
results_df = results_df[[
    "cluster", "cluster_size", "overlap", "pval", "fdr", "fold_enrichment", "overlap_genes"
]]
results_df = results_df.sort_values("pval")
print(results_df)
# Optionally, save to file:
results_df.to_csv("cluster_enrichment_results.tsv", sep="\t", index=False)
```