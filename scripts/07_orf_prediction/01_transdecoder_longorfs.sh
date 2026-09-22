#!/usr/bin/env bash

# Identify candidate long ORFs using TransDecoder v5.7.1.
#
# Usage:
# ./01_transdecoder_longorfs.sh final_transcriptome.fasta

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <final_transcriptome.fasta>"
    exit 1
fi

TRANSCRIPTOME="$1"

TransDecoder.LongOrfs \
    -t "$TRANSCRIPTOME"
