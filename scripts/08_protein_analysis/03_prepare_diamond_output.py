#!/usr/bin/env python3

"""
Convert DIAMOND BLASTp outfmt 6 output into a labeled CSV table.

Usage:
python 03_prepare_diamond_output.py \
    blastp.outfmt6 \
    diamond_output.csv
"""

import argparse
import pandas as pd


parser = argparse.ArgumentParser(
    description="Prepare DIAMOND BLASTp outfmt 6 results for downstream analysis."
)

parser.add_argument(
    "input",
    help="DIAMOND BLASTp output in standard outfmt 6 format."
)

parser.add_argument(
    "output",
    help="Output CSV file."
)

args = parser.parse_args()


# Load standard DIAMOND/BLAST tabular output
diamond_df = pd.read_csv(
    args.input,
    sep="\t",
    header=None
)

# Standard 12-column outfmt 6
diamond_df.columns = [
    "query",
    "subject",
    "percent_identity",
    "alignment_length",
    "mismatch",
    "gap_open",
    "q_start",
    "q_end",
    "s_start",
    "s_end",
    "e_value",
    "bit_score"
]

# Basic checks used in the original analysis
print("Missing values:")
print(diamond_df.isnull().sum())

print("\nDescriptive statistics:")
print(diamond_df.describe())

# Save processed table
diamond_df.to_csv(
    args.output,
    index=False
)

print(f"\nProcessed DIAMOND table saved to: {args.output}")
