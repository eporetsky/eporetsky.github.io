---
layout: page
title: Miscellaneous
permalink: /tutorials/miscellaneous
nav_order: 10
parent: Tutorials
has_toc: false
---

This section includes notes and code for a variety of different topics.

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Code Optimization

## Compression Benchmark: Large Gene Table

In this section, I'm benchmarking different ways to compress a large gene coexpression TSV file. The file in question is pretty typical for genomics: two text columns (gene IDs) and one float column (mutual rank), with a total uncompressed size of **10.5GB** and a compressed size of **1.5GB**. The goal is to see which approach is fastest for this kind of data, and whether it's worth the extra disk space to write the uncompressed file first. If you work with big genomics tables, you know that writing and compressing files can be a real bottleneck. Sometimes you want to save disk space, sometimes you want speed, and sometimes you want both. This benchmark should help figure out the trade-offs for a typical coexpression edge list.

### Methods

All methods below load the TSV file into a pandas DataFrame once, then write the data row-by-row (not using `df.to_csv`). This ensures a fair comparison of writing and compression methods, independent of pandas' internal CSV routines.

The four methods compared are:

1. **Write all rows to a plain file, then compress with `gzip` (command line)**
2. **Write all rows to a plain file, then compress with `pigz` (command line)**
3. **Write all rows directly to a gzipped file in Python (`gzip.open` module)**
4. **Write all rows directly to a pigz-compressed file in Python (`pigz.open` module)**

### Code

```python
import time
import subprocess
import gzip
import os
import pigz
import pandas as pd

input_file = "data/TaChineseSpring/PRJDB2496.mr.tsv"
plain_file_gzip = "test1.tsv"
gzip_cmd_file = "test1.tsv.gz"
plain_file_pigz = "test2.tsv"
pigz_cmd_file = "test2.tsv.gz"
gzip_line_file = "test3.tsv.gz"
pigz_line_file = "test4.tsv.gz"

# Read the file once into a pandas DataFrame
print("Reading input file into pandas DataFrame...")
df = pd.read_csv(input_file, sep='\t')
header = '\t'.join(df.columns) + '\n'

def write_rows(f):
    f.write(header)
    for row in df.itertuples(index=False):
        f.write('\t'.join(str(x) for x in row) + '\n')

# Method 1: Write all rows to plain file, then gzip
start = time.time()
with open(plain_file_gzip, 'w') as fout:
    write_rows(fout)
write_time_gzip = time.time() - start
start = time.time()
subprocess.run(["gzip", "-f", "-c", plain_file_gzip], stdout=open(gzip_cmd_file, "wb"))
gzip_cmd_time = time.time() - start
print(f"Method 1 (plain + gzip): Write: {write_time_gzip:.2f}s, Gzip: {gzip_cmd_time:.2f}s")

# Method 2: Write all rows to plain file, then pigz
start = time.time()
with open(plain_file_pigz, 'w') as fout:
    write_rows(fout)
write_time_pigz = time.time() - start
start = time.time()
subprocess.run(["pigz", "-f", plain_file_pigz])
pigz_time = time.time() - start
print(f"Method 2 (plain + pigz): Write: {write_time_pigz:.2f}s, Pigz: {pigz_time:.2f}s")

# Method 3: Write all rows directly to gzip
start = time.time()
with gzip.open(gzip_line_file, 'wt') as fout:
    write_rows(fout)
gzip_time = time.time() - start
print(f"Method 3 (gzip in Python): Total: {gzip_time:.2f}s")

# Method 4: Write all rows directly to pigz
start = time.time()
with pigz.open(pigz_line_file, 'wt') as fout:
    write_rows(fout)
pigz_line_time = time.time() - start
print(f"Method 4 (pigz.open in Python): Total: {pigz_line_time:.2f}s")
```

This setup ensures that all methods are compared on an equal footing, with the only difference being how the data is written and compressed.

### Results

Here are the results for each method, using a 10.5GB uncompressed TSV file (2 text columns, 1 float column):

- **Method 1 (plain + gzip):**
  - Write: 456.08s, Gzip: 408.29s, **Total: 864.37s**, Size: 1.56 GB
- **Method 2 (plain + pigz):**
  - Write: 454.03s, Pigz: 10.31s, **Total: 464.34s**, Size: 1.56 GB
- **Method 3 (gzip.open in Python):**
  - **Total: 2563.80s**, Size: 1.47 GB
- **Method 4 (pigz.open in Python):**
  - **Total: 865.94s**, Size: 1.56 GB

### Summary

- **pigz** (parallel gzip) is dramatically faster than standard gzip for compressing large files, whether used from the command line or via Python's `pigz.open`.
- Writing and compressing line-by-line in Python (`gzip` or `pigz.open`) is much slower than writing a plain file and compressing it afterward, but `pigz.open` is still much faster than Python's built-in `gzip`.
- The resulting file sizes are nearly identical for all methods, with a slight advantage for Python's `gzip` (likely due to compression settings).

**Bottom line:** If you care about speed, use `pigz` for compression. If you want to do everything in Python, `pigz.open` is much faster than the standard `gzip` module for large files. So if you prefer not to write large intermediate files to disk, writing rows directly to a compressed file with `pigz.open` will get you similar results in less than twice the time.