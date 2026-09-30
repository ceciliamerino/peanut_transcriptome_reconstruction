# Transcriptome quality assessment

This directory documents the quality and completeness assessment of peanut transcriptomes generated using the read-classification-based and genome-guided reconstruction strategies.

Quality assessment was performed at key stages of both reconstruction workflows using rnaQUAST, BUSCO, and `stats.sh` from BBTools.

## Read-classification-based reconstruction

For each genotype, three transcript sets were evaluated together using rnaQUAST v2.3.0:

1. the Trinity assembly,
2. the rnaSPAdes assembly, and
3. the final transcriptome obtained after EvidentialGene curation and removal of residual fungal sequences.

The recovered rnaQUAST command used:

- 12 threads
- paired-end reads
- `--min_alignment 50`
- `--busco fabales_odb10`
- `--lower_threshold 50`
- `--upper_threshold 95`
- `--strand_specific`

BUSCO v5.7.1 was executed through rnaQUAST using the `fabales_odb10` lineage dataset.

A generalized implementation is provided in:

`rnaquast_read_classification.sh`

## Genome-guided reconstruction

For each genotype, two transcript sets were evaluated together using rnaQUAST v2.3.0:

1. the initial Trinity genome-guided assembly, and
2. the final genome-guided transcriptome obtained after EvidentialGene curation and removal of residual fungal sequences.

The recovered rnaQUAST commands used the same assessment parameters as the read-classification-based workflow:

- 12 threads
- paired-end reads
- `--min_alignment 50`
- `--busco fabales_odb10`
- `--lower_threshold 50`
- `--upper_threshold 95`
- `--strand_specific`

BUSCO v5.7.1 was executed through rnaQUAST using the `fabales_odb10` lineage dataset.

A generalized implementation is provided in:

`rnaquast_genome_guided.sh`

## SuperTranscript auxiliary assessment

SuperTranscripts generated from the Trinity assemblies of the read-classification-based workflow were independently assessed in Galaxy using BUSCO v5.5.0.

The recovered Galaxy settings included:

- analysis mode: transcriptome
- lineage dataset: `fabales_odb10`
- lineage source: download
- BLAST E-value cutoff: 0.001
- candidate regions to consider: 3

This analysis was used as an auxiliary quality check. SuperTranscripts were not used as input for subsequent EvidentialGene curation.

Because this BUSCO analysis was performed through Galaxy, no command-line script is provided for this step.

## Basic assembly statistics

Basic transcriptome statistics were additionally calculated using `stats.sh` from BBTools v39.01.

For the read-classification-based workflow, statistics were calculated for:

- Trinity assemblies,
- rnaSPAdes assemblies, and
- final filtered transcriptomes.

For the genome-guided workflow, statistics were calculated for:

- initial Trinity genome-guided assemblies, and
- final filtered genome-guided transcriptomes.

A generalized implementation is provided in:

`assembly_stats.sh`

## Read concatenation for rnaQUAST

For transcriptome quality assessment with rnaQUAST, paired-end reads from the libraries corresponding to each genotype were concatenated separately for R1 and R2.

A generalized implementation is provided in:

`concatenate_reads_for_rnaquast.sh`

## Scripts

- `concatenate_reads_for_rnaquast.sh` — concatenates R1 and R2 read files separately for rnaQUAST assessment.
- `rnaquast_read_classification.sh` — evaluates Trinity, rnaSPAdes, and final read-classification-based transcriptomes with rnaQUAST.
- `rnaquast_genome_guided.sh` — evaluates initial Trinity genome-guided and final genome-guided transcriptomes with rnaQUAST.
- `assembly_stats.sh` — calculates basic assembly statistics using `stats.sh` from BBTools.
