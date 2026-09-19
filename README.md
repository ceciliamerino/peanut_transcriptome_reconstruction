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
```text

##Software

The workflows were implemented using:

BBTools v39.01
fastp v0.23.2
Trinity v2.15.1 and v2.15.2
rnaSPAdes v3.15.5
ORNA v2.0
GSNAP v2017-01-14
SAMtools
EvidentialGene v2022.04.05
Subread v2.0.6
rnaQUAST v2.3.0
BUSCO v5.5.0 and v5.7.1
TransDecoder v5.7.1
DIAMOND v2.1.10
SeqKit v2.10.1
Python and standard Unix command-line utilities
Data availability

Raw RNA-seq reads and curated transcriptome assemblies will be made publicly available through NCBI SRA and Zenodo, respectively.

##Citation

Manuscript in preparation.

##Contact

María Cecilia Merino
INIMEC-CONICET–UNC, Córdoba, Argentina
Email: cmerino@immf.uncor.edu
