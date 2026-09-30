#!/usr/bin/env bash

# Concatenate paired-end read files for rnaQUAST assessment.
#
# Usage:
# bash concatenate_reads_for_rnaquast.sh \
#     <input_directory> \
#     <output_R1.fq.gz> \
#     <output_R2.fq.gz>

INPUT_DIR="$1"
OUTPUT_R1="$2"
OUTPUT_R2="$3"

cat "$INPUT_DIR"/*1.fastq.gz > "$OUTPUT_R1"
cat "$INPUT_DIR"/*2.fastq.gz > "$OUTPUT_R2"
