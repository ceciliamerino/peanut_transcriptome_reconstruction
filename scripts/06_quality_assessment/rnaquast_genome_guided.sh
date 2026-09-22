#!/usr/bin/env bash

# Quality assessment of genome-guided transcriptomes using rnaQUAST.
#
# Usage:
# ./rnaquast_genome_guided.sh \
#   Trinity_GG.fasta \
#   final_GG_transcriptome.fasta \
#   reads_R1.fastq.gz \
#   reads_R2.fastq.gz \
#   output_directory

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <Trinity_GG.fasta> <final_GG.fasta> <R1.fastq.gz> <R2.fastq.gz> <output_dir>"
    exit 1
fi

TRINITY_GG="$1"
FINAL_GG="$2"
LEFT="$3"
RIGHT="$4"
OUTDIR="$5"

rnaQUAST.py \
    --threads 12 \
    --transcripts "$TRINITY_GG" "$FINAL_GG" \
    --left_reads "$LEFT" \
    --right_reads "$RIGHT" \
    --min_alignment 50 \
    --busco fabales_odb10 \
    --lower_threshold 50 \
    --upper_threshold 95 \
    --strand_specific \
    -o "$OUTDIR"
