# Read classification and host-read recovery

This directory contains scripts used for reference-based classification and recovery of host-derived RNA-seq reads.

## Step 1. Reference-based read classification (BBSplit)

Preprocessed paired-end RNA-seq reads were classified by simultaneous mapping against four *Arachis hypogaea* reference genome assemblies and the *Thecaphora frezzii* draft genome.

Reads assigned to any of the four peanut reference genomes were retained as host-derived reads.

Reference genome information is provided in:

`../../resources/reference_genomes.md`

## Step 2. Reference-guided host-read recovery (BBMap)

Reads assigned to the *T. frezzii* bin together with reads remaining unassigned after BBSplit classification were remapped against the four *Arachis hypogaea* reference genome assemblies using BBMap.

Reads mapping to the peanut references were recovered and combined by cultivar for subsequent de novo transcriptome reconstruction.

## Scripts

- `bbsplit_index.sh` — builds the BBSplit reference database.
- `bbsplit_classification.sh` — performs simultaneous host-pathogen read classification.
- `bbmap_host_read_recovery.sh` — remaps fungal-bin and unassigned reads against the four peanut reference genomes and recovers additional host-derived reads.
