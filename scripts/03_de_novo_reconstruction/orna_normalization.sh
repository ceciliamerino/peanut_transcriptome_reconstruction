#!/usr/bin/env bash

set -euo pipefail

# Normalize paired-end reads with ORNA prior to rnaSPAdes assembly.
#
# Usage:
#   bash orna_normalization.sh \
#       <R1.fq.gz> \
#       <R2.fq.gz> \
#       <output_prefix>
#
# Example:
#   bash orna_normalization.sh \
#       concat_Asc_final_1.fq.gz \
#       concat_Asc_final_2.fq.gz \
#       Normalized_concat_Asc_final

R1="$1"
R2="$2"
OUTPUT_PREFIX="$3"

ORNA \
    -pair1 "$R1" \
    -pair2 "$R2" \
    -output "$OUTPUT_PREFIX" \
    -base 1.7 \
    -kmer 21 \
    -type fastq

gzip -f "${OUTPUT_PREFIX}"*.fq
