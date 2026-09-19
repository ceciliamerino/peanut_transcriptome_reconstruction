# Scripts

This directory contains scripts and documentation for the bioinformatic workflows used in the comparative reconstruction of *Arachis hypogaea* transcriptomes.

The workflow is organized into the following stages:

- `01_preprocessing/` — preprocessing and paired-end read repair.
- `02_read_classification/` — BBSplit-based host–pathogen read classification and BBMap-based host read recovery.
- `03_denovo_reconstruction/` — Trinity and rnaSPAdes de novo transcriptome reconstruction.
- `04_genome_guided_reconstruction/` — genome-guided reconstruction using GSNAP, SAMtools, and Trinity.
- `05_fungal_filtering/` — identification and removal of residual *Thecaphora frezzii*-derived transcripts.
- `06_quality_assessment/` — transcriptome quality and completeness assessment.
- `07_orf_prediction/` — ORF prediction using TransDecoder and DIAMOND homology evidence.
- `08_protein_analysis/` — protein deduplication, protein-length statistics, and homology analyses.

Some analyses were performed through the Galaxy platform and are therefore documented in the corresponding README files rather than represented by command-line scripts.

Additional custom scripts will be added from the original analysis files where applicable.
