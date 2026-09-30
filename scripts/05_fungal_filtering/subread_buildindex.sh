#!/usr/bin/env bash

# Build a Subread index from the Thecaphora frezzii reference genome.
#
# Usage:
# bash subread_buildindex.sh \
#     <T_frezzii_genome.fna> \
#     <index_prefix>

REFERENCE_GENOME="$1"
INDEX_PREFIX="$2"

subread-buildindex \
    -o "$INDEX_PREFIX" \
    "$REFERENCE_GENOME"
