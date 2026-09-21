#!/usr/bin/env bash

set -euo pipefail

# EvidentialGene curation for the genome-guided reconstruction strategy.
#
# This script preserves the parameters used in the original analysis.

INPUT_FASTA="$1"
BLASTP_TABLE="$2"

tr2aacds.pl \
    -cdnaseq="$INPUT_FASTA" \
    -species=fabales \
    -ablastab="$BLASTP_TABLE" \
    -NCPU=12 \
    -MAXMEM=20000
