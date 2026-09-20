# De novo transcriptome reconstruction

This directory documents the read-classification-based de novo transcriptome reconstruction workflow.

The workflow was applied independently to each *Arachis hypogaea* cultivar.

## Host-read combination

Host-derived reads initially retained after BBSplit classification were combined with additional host reads recovered through BBMap remapping.

The script:

`combine_host_reads.sh`

performs this combination for paired-end reads.

## Trinity assembly

Combined host-derived paired-end reads were assembled using Trinity v2.15.1 through the Galaxy platform.

Parameters:

- Paired-end reads
- Strand-specific library orientation: FR
- In silico read normalization: enabled

## SuperTranscript generation

SuperTranscripts were generated from the Trinity assemblies using `Trinity_gene_splice_modeler.py` from Trinity v2.15.1.

The resulting SuperTranscript sets were evaluated with BUSCO v5.5.0 using the `fabales_odb10` lineage dataset.

These analyses were used only as an auxiliary quality assessment and were not used as input for subsequent transcriptome curation.

## ORNA normalization

Before rnaSPAdes assembly, combined paired-end reads were independently normalized using ORNA v2.0.

The script:

`orna_normalization.sh`

uses the parameters:

- Base parameter: 1.7
- k-mer size: 21

## rnaSPAdes assembly

ORNA-normalized paired-end reads were assembled using rnaSPAdes v3.15.5 through the Galaxy platform.

Parameters:

- Paired-end reads
- Strand-specific library orientation: FR

## Assembly combination

For each cultivar, the Trinity and rnaSPAdes transcript sets were concatenated prior to transcriptome curation with EvidentialGene.

## Scripts

- `combine_host_reads.sh` — combines initially retained host reads with additional host reads recovered using BBMap.
- `orna_normalization.sh` — normalizes combined paired-end reads with ORNA prior to rnaSPAdes assembly.
