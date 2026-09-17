# Protein sequence analysis

This directory documents the analyses performed on predicted protein sequences from the final peanut transcriptomes.

## Protein sequence deduplication

Predicted protein sequences were deduplicated by sequence using SeqKit v2.10.1 with:

`rmdup -s`

Deduplicated protein sets were used for protein-length analyses.

## Protein-length statistics

Protein-length distributions were compared among cultivars and transcriptome reconstruction strategies.

The following summary statistics were calculated using a custom Python script:

- Number of unique protein sequences (N)
- Median protein length
- 99th percentile (P99)
- Maximum protein length

## Protein homology assessment

DIAMOND BLASTp results generated during ORF prediction were further analyzed to characterize protein homology support.

Custom Python scripts were used to evaluate:

- Alignment length
- Bit score
- Percentage identity

These metrics were compared among cultivars and reconstruction strategies.
