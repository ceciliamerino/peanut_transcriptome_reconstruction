# Read classification

This directory contains the scripts used for reference-based classification and recovery of host-derived RNA-seq reads.

## Step 1. Reference-based read classification (BBSplit)

RNA-seq reads were classified by simultaneous mapping against four *Arachis hypogaea* reference genome assemblies and the *Thecaphora frezzii* reference genome using BBSplit.

The BBSplit reference database was built using the genome assemblies listed in `../../resources/reference_genomes.md`.

Reads assigned to any of the four *Arachis hypogaea* genome assemblies were retained as host-derived reads.

## Step 2. Reference-guided host read recovery (BBMap)

Reads assigned to the *Thecaphora frezzii* bin, together with reads remaining unassigned after BBSplit classification, were remapped against the four *Arachis hypogaea* genome assemblies using BBMap to recover additional host-derived reads.

The initially retained host reads and the reads recovered by BBMap were subsequently combined by cultivar for downstream de novo transcriptome reconstruction.

## Scripts

- `bbsplit_index.sh` — builds the BBSplit reference database.
- `bbsplit_classification.sh` — classifies paired-end RNA-seq reads against the host and fungal reference genomes.
- BBMap host-read recovery script — to be added.
