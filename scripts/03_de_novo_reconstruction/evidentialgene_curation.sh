#!/usr/bin/env bash

set -euo pipefail

# EvidentialGene curation for the read-classification-based
# de novo reconstruction strategy.
#
# This script preserves the parameters used in the original analysis.
#
# Usage:
#   bash evidentialgene_curation.sh \
#       <input_transcriptome.fasta> \
#       <blastp_table>

INPUT_FASTA="$1"
BLASTP_TABLE="$2"

tr2aacds.pl \
    -cdnaseq="$INPUT_FASTA" \
    -species=fabales \
    -ablastab="$BLASTP_TABLE"
