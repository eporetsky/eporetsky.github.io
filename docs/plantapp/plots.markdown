---
layout: page
title: Plots
permalink: /plantapp/plots/
nav_order: 2
parent: PlantApp
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

A detailed explenation of the SQLite queries will be provided here.

## Mini-heatmaps

The mini-heatmaps plotting app was inspired by the gene pathway and gene family heatmap visualization produced by MapMan. The PlantApp mini-heatmaps app is more customizable, taking  any number of values and plotted across any number of columns with a custom range for the heatmap colors. This can be useful for visualizing quantitative changes in any group of genes. Below is the part of the code the plots the sns.heatmap and then the rectangle that covers the extra cells. I might make an effort to find a better way to make these plots, but for most cases this seems to work, with some exceptions due to the rectangle not covering the extra cells properly.

Press the "Copy example" button and paste the example data into the text box to get the mini-heatmap. Replacing numerical values with NaN will color the cell white. The rest of the inputs change the number of columns in the mini-heatmap and the color ranges.

```
sns.set(rc={"figure.figsize":(3, 3)})
ax = sns.heatmap(heatmap,
            cmap="coolwarm",
            vmin=min,
            vmax=max,
            cbar=cbar,
            center=center,
            linewidths = 2,
            linecolor="black",
            square=True, 
            xticklabels=False,
            yticklabels=False)
# sns.heatmap doesn't draw right and bottom border line for some reason so I manually add it
ax.add_patch(Rectangle((0,0), row_len, row_num, edgecolor='black', fill=False, lw=4))
ax.add_patch(Rectangle((row_len + 0.05 - mask_ln, fc_ln // row_len + 0.05), mask_ln-0.005, 0.95, color='white'))
```

![](../../assets/images/apps_plots_miniheatmap.png)

## Manhattan Plots

Coming soon.