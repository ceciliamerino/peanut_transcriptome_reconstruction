#!/usr/bin/env bash

set -euo pipefail

# Genome-guided transcriptome reconstruction with Trinity v2.15.2.
#
# This script preserves the parameters used in the original analysis.
#
# Usage:
#   bash trinity_genome_guided.sh \
#       <trinity_singularity_image> \
#       <working_directory> \
#       <sorted_bam> \
#       <output_directory>
#
# Example:
#   bash trinity_genome_guided.sh \
#       /path/to/trinityrnaseq.v2.15.2.simg \
#       /path/to/analysis \
#       /path/to/sorted.bam \
#       /path/to/trinity_output

TRINITY_IMAGE="$1"
WORKDIR="$2"
SORTED_BAM="$3"
OUTPUT_DIR="$4"

singularity exec \
    --bind "${WORKDIR}:${WORKDIR}" \
    "$TRINITY_IMAGE" \
    Trinity \
    --genome_guided_bam "$SORTED_BAM" \
    --max_memory 40G \
    --CPU 5 \
    --no_normalize_reads \
    --output "$OUTPUT_DIR" \
    --genome_guided_max_intron 15000
