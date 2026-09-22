#!/usr/bin/env python3

"""
Calculate protein-length summary statistics from a FASTA file containing
unique predicted protein sequences.

Statistics reported:
- N: number of unique protein sequences
- median protein length
- 99th percentile (P99)
- maximum protein length

Usage:
python 02_protein_length_summary.py \
    unique_proteins.pep \
    Gra \
    BBSplit \
    protein_length_summary.tsv
"""

import argparse
from pathlib import Path

import numpy as np
import pandas as pd
from Bio import SeqIO


parser = argparse.ArgumentParser(
    description="Calculate protein-length statistics from unique predicted proteins."
)

parser.add_argument(
    "fasta",
    help="FASTA file containing unique predicted protein sequences."
)

parser.add_argument(
    "cultivar",
    help="Cultivar identifier, e.g. Gra, FA, or Asc."
)

parser.add_argument(
    "method",
    help="Transcriptome reconstruction method, e.g. BBSplit or Genome-guided."
)

parser.add_argument(
    "output",
    help="Output TSV file."
)

args = parser.parse_args()


# Read protein sequences and calculate lengths in amino acids
lengths = np.array(
    [len(record.seq) for record in SeqIO.parse(args.fasta, "fasta")],
    dtype=int
)

# Summary statistics
N = lengths.size
median_length = float(np.median(lengths))
p99 = float(np.percentile(lengths, 99))
max_length = int(lengths.max())

print(f"N={N:,}")
print(
    f"median={median_length:.1f} aa | "
    f"P99={p99:.1f} aa | "
    f"max={max_length} aa"
)

# Prepare output row
row = pd.DataFrame([{
    "Cultivar": args.cultivar,
    "Assembly_method": args.method,
    "N": N,
    "Median_aa": round(median_length, 1),
    "P99_aa": round(p99, 1),
    "Max_aa": max_length
}])

output_file = Path(args.output)
output_file.parent.mkdir(parents=True, exist_ok=True)

# Preserve the original workflow: append one cultivar/method per run
write_header = not output_file.exists()

row.to_csv(
    output_file,
    sep="\t",
    index=False,
    mode="a",
    header=write_header
)
