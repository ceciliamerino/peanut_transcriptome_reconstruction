#!/usr/bin/env bash

# Search TransDecoder-predicted peptides against the NCBI nr protein database
# using DIAMOND BLASTp v2.1.10.
#
# Usage:
# ./02_diamond_blastp.sh longest_orfs.pep nr.dmnd blastp.outfmt6

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <longest_orfs.pep> <nr.dmnd> <output.outfmt6>"
    exit 1
fi

QUERY="$1"
DATABASE="$2"
OUTPUT="$3"

diamond blastp \
    --query "$QUERY" \
    --db "$DATABASE" \
    --max-target-seqs 1 \
    --outfmt 6 \
    --threads 10 \
    --out "$OUTPUT"
