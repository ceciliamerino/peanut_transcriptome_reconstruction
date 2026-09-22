#!/usr/bin/env bash

# Final coding-region prediction using TransDecoder v5.7.1
# with DIAMOND BLASTp homology evidence.
#
# Usage:
# ./03_transdecoder_predict.sh final_transcriptome.fasta blastp.outfmt6

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <final_transcriptome.fasta> <blastp.outfmt6>"
    exit 1
fi

TRANSCRIPTOME="$1"
BLASTP_RESULTS="$2"

TransDecoder.Predict \
    -t "$TRANSCRIPTOME" \
    --retain_blastp_hits "$BLASTP_RESULTS" \
    --single_best_only
