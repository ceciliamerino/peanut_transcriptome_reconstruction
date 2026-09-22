#!/usr/bin/env bash

# Quality assessment of read-classification-based transcriptomes using rnaQUAST.
#
# Usage:
# ./rnaquast_read_classification.sh \
#   Trinity.fasta \
#   rnaSPAdes.fasta \
#   final_transcriptome.fasta \
#   reads_R1.fastq.gz \
#   reads_R2.fastq.gz \
#   output_directory

if [ "$#" -ne 6 ]; then
    echo "Usage: $0 <Trinity.fasta> <rnaSPAdes.fasta> <final.fasta> <R1.fastq.gz> <R2.fastq.gz> <output_dir>"
    exit 1
fi

TRINITY="$1"
RNASPADES="$2"
FINAL="$3"
LEFT="$4"
RIGHT="$5"
OUTDIR="$6"

rnaQUAST.py \
    --threads 12 \
    --transcripts "$TRINITY" "$RNASPADES" "$FINAL" \
    --left_reads "$LEFT" \
    --right_reads "$RIGHT" \
    --min_alignment 50 \
    --busco fabales_odb10 \
    --lower_threshold 50 \
    --upper_threshold 95 \
    --strand_specific \
    -o "$OUTDIR"
