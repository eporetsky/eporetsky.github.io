---
layout: page
title: NailScan
permalink: /analysis-tools/nailscan
has_toc: false
---

[GitHub — NailScan](https://github.com/eporetsky/nailscan){: .btn .btn-purple}

**NailScan** runs **fast profile HMM searches** with **[nail](https://doi.org/10.1101/2024.01.27.577580)** (Nail is an Alignment Inference tooL) against **InterPro member databases**—by default **Pfam**, **NCBIfam**, **SUPERFAMILY**, **PANTHER**, and **Gene3D**. Nail uses **MMseqs2** for seeding and approximates the HMMER3 Forward/Backward algorithm, so throughput is much higher than a plain HMMER3 scan on the same libraries.

NailScan is **not** InterProScan and is **not** intended to reproduce identical InterProScan calls; it targets **scalable HMM-based domain annotation** where speed matters, with post-processing aimed at InterProScan-like filtering. It remains **under development** and is **not affiliated** with nail, InterPro, or the member databases. Quick start, `install.sh`, batch/single shell wrappers, supported DBs, and benchmark notes are in the [NailScan repository](https://github.com/eporetsky/nailscan).
