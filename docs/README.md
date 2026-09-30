# Workflow diagrams

This directory contains schematic representations of the two transcriptome reconstruction workflows evaluated in this study.

## Read-classification-based de novo reconstruction

Files:

- `Pipeline_RC_based.png`
- `Pipeline_RC_based.svg`

The diagram summarizes RNA-seq preprocessing, host–pathogen read classification, *de novo* assembly with Trinity and rnaSPAdes, transcriptome curation, removal of residual fungal sequences, quality assessment, ORF prediction, and protein homology assessment.

The workflow was applied independently to Granoleico, FAVar-2, and Ascasubi.

## Genome-guided reconstruction

Files:

- `Pipeline_GG.png`
- `Pipeline_GG.svg`

The diagram summarizes RNA-seq preprocessing, Trinity in silico read normalization, alignment to the combined *Arachis duranensis* and *Arachis ipaensis* reference using GSNAP, BAM processing and merging with SAMtools, genome-guided reconstruction with Trinity, transcriptome curation with EvidentialGene, removal of residual fungal sequences using Subread and custom Python filtering scripts, quality assessment, ORF prediction, and protein homology assessment.

The workflow was applied independently to Granoleico, FAVar-2, and Ascasubi.

## File formats

PNG files are provided for direct visualization in GitHub, while SVG files provide editable vector versions of the workflow diagrams.
