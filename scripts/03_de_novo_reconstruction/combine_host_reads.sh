#!/usr/bin/env bash

set -euo pipefail

# Combine host reads initially retained after BBSplit classification
# with additional host reads recovered by BBMap.
#
# Usage:
#   bash combine_host_reads.sh \
#       <retained_R1.fq.gz> \
#       <retained_R2.fq.gz> \
#       <recovered_R1.fq.gz> \
#       <recovered_R2.fq.gz> \
#       <output_prefix>
#
# Example:
#   bash combine_host_reads.sh \
#       concat_Asc_1.fq.gz \
#       concat_Asc_2.fq.gz \
#       concat_Asc_recovered_1.fq.gz \
#       concat_Asc_recovered_2.fq.gz \
#       concat_Asc_final

RETAINED_R1="$1"
RETAINED_R2="$2"
RECOVERED_R1="$3"
RECOVERED_R2="$4"
OUTPUT_PREFIX="$5"

cat "$RETAINED_R1" "$RECOVERED_R1" > "${OUTPUT_PREFIX}_1.fq.gz"
cat "$RETAINED_R2" "$RECOVERED_R2" > "${OUTPUT_PREFIX}_2.fq.gz"

echo "Combined host reads generated:"
echo "${OUTPUT_PREFIX}_1.fq.gz"
echo "${OUTPUT_PREFIX}_2.fq.gz"
