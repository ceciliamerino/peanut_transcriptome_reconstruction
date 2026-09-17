# De novo transcriptome reconstruction

This directory documents the read-classification-based de novo transcriptome reconstruction workflow.

The workflow was applied independently to each *Arachis hypogaea* cultivar.

## Trinity assembly

Host-derived paired-end reads recovered after BBSplit classification and BBMap remapping were combined by cultivar and assembled using Trinity v2.15.1 through the Galaxy platform.

Parameters:

- Library type: paired-end
- Strand-specific library orientation: FR
- In silico read normalization: enabled

## SuperTranscript generation

SuperTranscripts were generated from the Trinity assemblies using `Trinity_gene_splice_modeler.py` from Trinity v2.15.1.

The resulting SuperTranscript sets were evaluated with BUSCO v5.5.0 using the `fabales_odb10` lineage dataset.

SuperTranscript analyses were used only as an auxiliary quality assessment and were not used as input for subsequent transcriptome curation.

## rnaSPAdes assembly

Before rnaSPAdes assembly, paired-end reads were independently normalized using ORNA v2.0.

ORNA parameters:

- Base parameter: 1.7
- k-mer size: 21

Normalized reads were assembled using rnaSPAdes v3.15.5 through the Galaxy platform.

Parameters:

- Library type: paired-end
- Strand-specific library orientation: FR

## Assembly combination

For each cultivar, the Trinity and rnaSPAdes transcript sets were concatenated prior to transcriptome curation with EvidentialGene.
