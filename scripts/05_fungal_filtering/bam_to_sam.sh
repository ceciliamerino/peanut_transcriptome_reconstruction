#!/usr/bin/env bash

# Convert Subread BAM output to SAM format for downstream transcript filtering.

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input.bam> <output.sam>"
    exit 1
fi

INPUT_BAM="$1"
OUTPUT_SAM="$2"

samtools view "$INPUT_BAM" > "$OUTPUT_SAM"
