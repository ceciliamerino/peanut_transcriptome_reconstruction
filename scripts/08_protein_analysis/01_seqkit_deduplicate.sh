#!/usr/bin/env bash

# Remove duplicate predicted protein sequences using SeqKit v2.10.1.
#
# Usage:
# ./01_seqkit_deduplicate.sh predicted_proteins.pep unique_proteins.pep

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <predicted_proteins.pep> <unique_proteins.pep>"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"

seqkit rmdup -s "$INPUT" -o "$OUTPUT"
