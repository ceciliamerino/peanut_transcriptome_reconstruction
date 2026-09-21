#!/usr/bin/env bash

# Align an EvidentialGene-curated transcriptome against
# the Thecaphora frezzii reference genome using Subread.
#
# This reproduces the command documented for the
# genome-guided reconstruction strategy.
#
# Usage:
# bash subread_alignment_genome_guided.sh \
#     <curated_transcriptome.mrna> \
#     <index_prefix> \
#     <output_prefix>

INPUT_FASTA="$1"
INDEX_PREFIX="$2"
OUTPUT_PREFIX="$3"

subread-align \
    -i "$INDEX_PREFIX" \
    -r "$INPUT_FASTA" \
    -T 10 \
    -o "$OUTPUT_PREFIX" \
    --SAMoutput \
    -t 1
