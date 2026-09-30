# Workflow diagrams

This directory contains schematic representations of the two transcriptome reconstruction workflows evaluated in this study.

## Read-classification-based de novo reconstruction

Files:

- `Pipeline_RC_based.png`
- `Pipeline_RC_based.svg`

The diagram summarizes RNA-seq preprocessing, host–pathogen read classification, de novo assembly with Trinity and rnaSPAdes, transcriptome curation, removal of residual fungal sequences, quality assessment, ORF prediction, and protein homology assessment.

The workflow was applied independently to Granoleico, FAVar-2, and Ascasubi.

## Genome-guided reconstruction

`genome_guided_pipeline`

Read normalization, alignment to the combined *Arachis duranensis* and *Arachis ipaensis* reference, genome-guided Trinity assembly, transcriptome curation, removal of residual fungal sequences, quality assessment, ORF prediction, and protein homology assessment.
