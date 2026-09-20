#!/usr/bin/env bash

set -euo pipefail

# Recover additional Arachis hypogaea reads by remapping reads
# assigned to the fungal/unassigned fraction against four peanut
# reference genome assemblies.
#
# Usage:
#   bash bbmap_host_read_recovery.sh \
#       <cultivar> \
#       <R1.fastq.gz> \
#       <R2.fastq.gz> \
#       <reference_genome_directory> \
#       <output_directory>
#
# Example:
#   bash bbmap_host_read_recovery.sh \
#       Asc \
#       concat_ASM_UNM_Asc_1.fq.gz \
#       concat_ASM_UNM_Asc_2.fq.gz \
#       /path/to/Arachis_hypogaea_genomes \
#       ./bbmap_recovery_Asc

CULTIVAR="$1"
R1="$2"
R2="$3"
REF_DIR="$4"
OUTDIR="$5"

mkdir -p "$OUTDIR"

# Identify the four Arachis hypogaea reference genomes
shopt -s nullglob
REFERENCES=("$REF_DIR"/*genome_main.fna.gz)

if [ "${#REFERENCES[@]}" -ne 4 ]; then
    echo "Error: expected 4 Arachis hypogaea reference genomes in:"
    echo "$REF_DIR"
    echo "Found: ${#REFERENCES[@]}"
    exit 1
fi

echo "Cultivar: $CULTIVAR"
echo "R1: $R1"
echo "R2: $R2"
echo "Reference directory: $REF_DIR"
echo "Output directory: $OUTDIR"
echo

for REF in "${REFERENCES[@]}"
do
    REF_NAME=$(basename "$REF" .genome_main.fna.gz)
    PREFIX="${OUTDIR}/${REF_NAME}_${CULTIVAR}"

    echo "========================================"
    echo "Mapping against: $REF_NAME"
    echo "========================================"

    bbmap.sh \
        -Xmx50g \
        in1="$R1" \
        in2="$R2" \
        ref="$REF" \
        outm="${PREFIX}.mapped.sam" \
        outu="${PREFIX}.unmapped.sam"

    # Convert mapped reads back to paired FASTQ files
    samtools fastq \
        "${PREFIX}.mapped.sam" \
        -1 "${PREFIX}_mapped_1.fq" \
        -2 "${PREFIX}_mapped_2.fq" \
        -0 /dev/null \
        -s /dev/null \
        -n

    gzip -f "${PREFIX}_mapped_1.fq"
    gzip -f "${PREFIX}_mapped_2.fq"

done

# Combine host reads recovered against the four peanut references
cat "${OUTDIR}"/*_"${CULTIVAR}"_mapped_1.fq.gz \
    > "${OUTDIR}/concat_${CULTIVAR}_recovered_1.fq.gz"

cat "${OUTDIR}"/*_"${CULTIVAR}"_mapped_2.fq.gz \
    > "${OUTDIR}/concat_${CULTIVAR}_recovered_2.fq.gz"

echo
echo "Host-read recovery completed."
echo "Recovered R1: ${OUTDIR}/concat_${CULTIVAR}_recovered_1.fq.gz"
echo "Recovered R2: ${OUTDIR}/concat_${CULTIVAR}_recovered_2.fq.gz"
