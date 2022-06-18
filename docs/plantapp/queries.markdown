---
layout: page
title: Queries
permalink: /plantapp/queries/
nav_order: 1
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

## Query Gene Annotations

This is an example of the gene annotation query. While this approach is less efficient than quering a list of genes, it does allow to preserve the origianl gene list, even when genes are missing.
```
ls = []
for entity in entity_list:
    cursorObj = con.cursor()
    cursorObj.execute('''SELECT gene_id, gene_annotation 
                        FROM gene_annotations 
                        WHERE gene_id =  ?  ''', (entity,))
    selected = cursorObj.fetchall()
    if selected == []:
        ls.append("Gene not found")
    else:
        ls.append(selected[0][1])    
```

## Query Gene Family IDs

This is an example of the gene family ID query. In this case, missing queries are ignored (by SQLite).
```
con = sqlite3.connect(sqnce_path) # deploy with this
cursorObj = con.cursor()
if  "all" in genotypes or genotypes == "all":
    genotypes = distinct_db_vals(sqnce_path, "gene_families", "genotype_id", return_ls=True) 
genotypes = str("','".join(genotypes))
families = str("','".join(families))
df = pd.read_sql_query("""SELECT protein_id, genotype_id, family_name 
                        FROM gene_families
                        WHERE genotype_id IN ('{0}') AND family_name IN ('{1}')""".format(genotypes, families), con)

```