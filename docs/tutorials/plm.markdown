---
layout: page
title: Protein Language Models
permalink: /tutorials/plm
nav_order: 6
parent: Tutorials
has_toc: false
---

This section includes code for processing and analyzing different aspects of protein language models (PLMs). 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# Ankh

[Paper](https://arxiv.org/abs/2301.06568){: .btn .btn-purple }
[GitHub](https://github.com/agemagician/Ankh){: .btn .btn-blue }

When I worked on developing PhosBoost, a protein phosphorylation prediction method that uses PLMs for generating the data, I made the mistake of using only the CPU nodes on the USDA SCINet cluster. It wasn't time or resource efficient, but it got the job done and I didn't need to run it again. Almost two years passed since then, and I have started to think about PLMs again. This time, for reasons related to my PlantApp database, I wanted to look at the state of PLMs specifically for CPU implementations. I recently added an LLM for metadata parsing so users can retrieve relevant experiments. What I found exciting was that this LLM, `fastembed`, can easily work on a single CPU and doesn't require barely any resources. I was wondering if any similar advances have been made in the PLM field. This is where Ankh comes in. According to their benchmarks, Ankh Base is competitive with ProtT5-XL-UniRef50, the model I used for training PhosBoost, while Ankh Large outcometes it. As far embedding speed, on my machine (72 threads, but not all are being used) it takes Ankh about 15 minutes to generate the embedding vectors for 1,000 protein sequences. This means that I can run whole genomes in a few hours in my home lab.

Here is the code for running Ankh on a FASTA file:

```
import ankh
import torch
from Bio import SeqIO
from tqdm import tqdm

model, tokenizer = ankh.load_base_model()

fasta_list = list(SeqIO.parse(open("data/fasta/AtCol-0.fa"), "fasta"))
protein_sequences = [str(seq.seq) for seq in fasta_list]
protein_sequences = [list(seq) for seq in protein_sequences]

inputs_embedding = []
with torch.no_grad():
    for sample in tqdm(protein_sequences):
        ids = tokenizer.batch_encode_plus([sample], add_special_tokens=True, 
                                            padding=True, is_split_into_words=True, 
                                            return_tensors="pt")
        embedding = model(input_ids=ids['input_ids'].to("cpu"))[0]
        embedding = embedding[0].detach().cpu().numpy()[0:-1]
        inputs_embedding.append(embedding)
```

Next, it will be interesting to retrain PhosBoost with the Ankh embedding data and test how it compares to ProtT5-XL-UniRef50.