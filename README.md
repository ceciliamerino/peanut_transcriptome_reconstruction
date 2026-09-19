# Comparative Transcriptome Reconstruction Strategies in Peanut

This repository contains the bioinformatics workflows used to reconstruct and evaluate transcriptomes of *Arachis hypogaea* cultivars under *Thecaphora frezzii* infection.

Two complementary transcriptome reconstruction strategies were compared:

1. Read-classification-based de novo reconstruction
2. Genome-guided reconstruction

The workflows include RNA-seq preprocessing, host–pathogen read classification, de novo and genome-guided transcriptome reconstruction, EvidentialGene curation, removal of residual fungal sequences, transcriptome quality assessment, ORF prediction, and protein sequence analyses.

Three peanut cultivars were analyzed independently: Granoleico, FAVar-2, and Ascasubi.

## Workflows

### Read-classification-based de novo reconstruction

RNA-seq reads were classified against four *Arachis hypogaea* reference genomes and the *T. frezzii* genome using BBSplit. Host-derived reads were assembled independently with Trinity and rnaSPAdes and subsequently curated with EvidentialGene.

### Genome-guided reconstruction

Preprocessed reads were normalized and aligned to a combined reference generated from the diploid peanut progenitors *Arachis duranensis* and *Arachis ipaensis*. Genome-guided transcriptomes were reconstructed with Trinity and subsequently curated with EvidentialGene.

Both strategies included post-curation filtering against the *T. frezzii* genome prior to transcriptome evaluation and coding-sequence prediction.

## Repository structure

```text
docs/
    Workflow diagrams

resources/
    Reference genome information

scripts/
    01_preprocessing/
    02_read_classification/
    03_denovo_reconstruction/
    04_genome_guided_reconstruction/
    05_fungal_filtering/
    06_quality_assessment/
    07_orf_prediction/
    08_protein_analysis/

results/
    Summary results
