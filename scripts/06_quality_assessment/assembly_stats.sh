#!/usr/bin/env bash

# Basic transcriptome assembly statistics using stats.sh from BBTools.
#
# Usage:
# ./assembly_stats.sh assembly1.fasta [assembly2.fasta ...]

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <assembly1.fasta> [assembly2.fasta ...]"
    exit 1
fi

for FASTA in "$@"; do
    echo "### ${FASTA}"
    stats.sh "$FASTA"
    echo
done
