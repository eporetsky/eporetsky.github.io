---
layout: page
title: Proteins
permalink: /bioinformatics/proteins
nav_order: 3
parent: Bioinformatics
has_toc: false
---

This section includes code for processing and analyzing different aspects of protein structures. 

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

# AlphaFill

## Transplanting ligands

We are going to use the ColabFold predicted strure of the grape UGT72B27 uridine diphosphate-dependent glycosyltransferase (UGT) as an example. The AlphaFill webserver can be used to transplant a uridine diphosphate (UGT) ligand from the experimental 2VG8 structure. The code below can be used to convert the AlphaFill CIF file to a PDB file. We want to generate a PDB file because many tools for analyzing protein-ligand interactions, such as PLIP, work better with PDB-formatted files. We will use OpenBabel to convert the CIF file to PDB, and then use ProDy to edit the PDB file so it is compatible for PLIP-based analysis, but depending on which tools you intend to use, the PDB file might need to be modified in different ways. Download the ColabFold predicted structure of UGT72B27 [here](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/files/UGT72B27.pdb). Submit the PDB file to the [AlphaFill webserver](https://alphafill.eu), select the UGT ligand only, and download the AlphaFill CIF file as shown in the image below.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/files/UGT72B27.afill.jpg?raw=true){: width="300" }

```
from openbabel import openbabel
import prody as pr

# Convert the AlphaFill CIF file to a temporary PDB file using OpenBabel
prot_id = "UGT72B27"
obConversion = openbabel.OBConversion()
obConversion.SetInAndOutFormats("cif", "pdb")
mol = openbabel.OBMol()
obConversion.ReadFile(mol, '{}.afill.cif'.format(prot_id))
obConversion.WriteFile(mol, '{}.afill.tmp.pdb'.format(prot_id))

# Load PDB file using ProDy
structure = pr.parsePDB('{}.afill.tmp.pdb'.format(prot_id))

# Get the ResNames of all ligands in the PDB file
# In this example, the res_name_list only contains a single ligand: 'UGT'
res_name_list = list(set(structure.select("not protein").getResnames()))
print(res_name_list, len(res_name_list)) 

# Find the last protein Resnum so we can set a larger ligand Resnum
max_res = structure.select('protein').getResindices().max()

# In this example we assume that there is only one ligand (UGT) in the PDB file
# We can use ProDy to iterate over every ligand atom and make the appropriate edits
res_name = "UGT"
for chain in structure.select('resname {}'.format(res_name)):
    # Change the flag from ATOM to HETATM for the ligand
    chain.setFlag("hetatm", 'hetatm')
    # Set the ligand chain ID to 'B', keeping the protein chain ID as 'A'
    chain.setChid("B")
    # Set the ligand Resnum to be max_res + 1
    chain.setResnum(max_res + 1)

# Save the modified structure as the final PDB file
pr.writePDB('{}.afill.pdb'.format(af2_id), structure)
```

Now you can submit the modified AlphaFill PDB file (UGT72B27.afill.pdb) to the [PLIP webserver](https://plip-tool.biotec.tu-dresden.de/plip-web/plip/index) to identify which protein residues interact with the different ligand atoms. As you can see in the image below, PLIP identified 13 hydrogen bonds and 2 salt bridges between the protein residues and the UDP ligand.

![](https://github.com/eporetsky/eporetsky.github.io/blob/master/assets/files/UGT72B27.afill.jpg?raw=true){: width="300" }

NOTE: AlphaFill does not guarantee that the transplanted ligand occupies the correct position and pose in the predicted structure, nor does it guarantee that it is an actual ligand for the predicted structure. The resulting AlphaFill structure and predicted interactions by PLIP should be carefully assessed.

## Transplanting cofactors

WIP