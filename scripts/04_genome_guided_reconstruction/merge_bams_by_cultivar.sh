#!/usr/bin/env bash

set -euo pipefail

# Merge coordinate-sorted BAM files belonging to one cultivar
# and sort the merged BAM prior to genome-guided Trinity assembly.
#
# Usage:
#   bash merge_bams_by_cultivar.sh <output_prefix> <bam1> <bam2> [bam3 ...]

OUTPUT_PREFIX="$1"
shift

samtools merge \
    -@ 10 \
    "${OUTPUT_PREFIX}.bam" \
    "$@"

samtools sort \
    -@ 8 \
    -o "${OUTPUT_PREFIX}.sorted.bam" \
    "${OUTPUT_PREFIX}.bam"

samtools view -H "${OUTPUT_PREFIX}.sorted.bam" | grep '@HD'
