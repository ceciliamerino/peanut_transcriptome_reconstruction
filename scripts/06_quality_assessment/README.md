# Transcriptome quality assessment

This directory documents the quality and completeness assessment of the reconstructed peanut transcriptomes.

Quality assessment was performed at key stages of both transcriptome reconstruction strategies.

## Read-classification-based reconstruction

The following transcript sets were evaluated:

- Trinity assemblies
- rnaSPAdes assemblies
- Final read-classification-based transcriptomes

## Genome-guided reconstruction

The following transcript sets were evaluated:

- Initial Trinity genome-guided assemblies
- Final genome-guided transcriptomes

## rnaQUAST and BUSCO

Transcriptome structure and gene completeness were assessed using rnaQUAST v2.3.0 in strand-specific mode.

BUSCO v5.7.1 was run using the `fabales_odb10` lineage dataset.

## Assembly statistics

Basic assembly statistics, including:

- Number of transcripts
- Total assembled length
- N50

were calculated using `stats.sh` from BBTools v39.01.

Direct comparisons between reconstruction strategies were based on the corresponding final transcriptomes.
