#!/usr/bin/env python3

"""
Pool processed DIAMOND BLASTp datasets and generate the three panels
used for the protein-homology assessment.

Usage:
python 04_plot_pooled_diamond.py \
    diamond_Gra_output.csv \
    diamond_Gra_GG_output.csv \
    diamond_FA_output.csv \
    diamond_FA_GG_output.csv \
    diamond_Asc_output.csv \
    diamond_Asc_GG_output.csv \
    --outdir figures_ALL
"""

import argparse
import os

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from matplotlib.ticker import StrMethodFormatter


parser = argparse.ArgumentParser(
    description="Pool DIAMOND result tables and generate protein-homology plots."
)

parser.add_argument(
    "inputs",
    nargs="+",
    help="Processed DIAMOND CSV files."
)

parser.add_argument(
    "--outdir",
    default="figures_ALL",
    help="Output directory for figures."
)

args = parser.parse_args()


# ======================== STYLE ========================

sns.set_style("white")

plt.rcParams.update({
    "font.family": "sans-serif",
    "font.sans-serif": [
        "Helvetica",
        "Arial",
        "Liberation Sans",
        "DejaVu Sans"
    ],
    "font.size": 12,
    "axes.labelsize": 12,
    "xtick.labelsize": 11,
    "ytick.labelsize": 11,
    "axes.linewidth": 1.0
})

os.makedirs(args.outdir, exist_ok=True)

FIGSIZE = (7.0, 4.5)
DPI = 600
GRAY = "0.7"
FMT_COMMA = StrMethodFormatter("{x:,.0f}")


# ======================== LOAD + CONCAT ========================

dfs = []

for input_file in args.inputs:

    if not os.path.exists(input_file):
        raise FileNotFoundError(
            f"Input file not found: {input_file}"
        )

    tmp = pd.read_csv(input_file)

    needed = [
        "bit_score",
        "alignment_length",
        "percent_identity"
    ]

    missing = [
        column for column in needed
        if column not in tmp.columns
    ]

    if missing:
        raise ValueError(
            f"{input_file} is missing columns: {missing}"
        )

    tmp["source_file"] = os.path.basename(input_file)

    dfs.append(
        tmp[needed + ["source_file"]]
    )


df_all = pd.concat(
    dfs,
    ignore_index=True
).dropna(
    subset=[
        "bit_score",
        "alignment_length",
        "percent_identity"
    ]
)

print(f"Input files: {len(args.inputs)}")
print(f"Total alignments: {len(df_all):,}")


# ======================== FIGURE 4A ========================

fig, ax = plt.subplots(figsize=FIGSIZE)

sns.scatterplot(
    data=df_all,
    x="bit_score",
    y="alignment_length",
    color=GRAY,
    alpha=0.6,
    s=12,
    edgecolor=None,
    ax=ax
)

ax.set_xlabel("Bit score")
ax.set_ylabel("Alignment length (aa)")

ax.xaxis.set_major_formatter(FMT_COMMA)
ax.yaxis.set_major_formatter(FMT_COMMA)

sns.despine(ax=ax)

fig.tight_layout()

fig.savefig(
    f"{args.outdir}/Figure_4A_bit_score_vs_alignment_length.tif",
    dpi=DPI
)

plt.close(fig)


# ======================== FIGURE 4B ========================

fig, ax = plt.subplots(figsize=FIGSIZE)

sns.scatterplot(
    data=df_all,
    x="bit_score",
    y="percent_identity",
    color=GRAY,
    alpha=0.6,
    s=12,
    edgecolor=None,
    ax=ax
)

ax.set_xlabel("Bit score")
ax.set_ylabel("Percent identity (%)")

ax.xaxis.set_major_formatter(FMT_COMMA)
ax.yaxis.set_major_formatter(FMT_COMMA)

sns.despine(ax=ax)

fig.tight_layout()

fig.savefig(
    f"{args.outdir}/Figure_4B_bit_score_vs_percent_identity.tif",
    dpi=DPI
)

plt.close(fig)


# ======================== FIGURE 4C ========================
# Percent-identity histogram with broken Y axis.

fig, (ax_top, ax_bot) = plt.subplots(
    2,
    1,
    figsize=FIGSIZE,
    sharex=True,
    gridspec_kw={
        "height_ratios": [1, 2],
        "hspace": 0.05
    }
)

for ax in (ax_top, ax_bot):

    sns.histplot(
        df_all["percent_identity"],
        bins=30,
        kde=True,
        color=GRAY,
        edgecolor="0.2",
        linewidth=0.8,
        alpha=0.8,
        ax=ax
    )

    for line in ax.lines:
        line.set_color("black")
        line.set_linewidth(1.0)

    ax.yaxis.set_major_formatter(FMT_COMMA)
    sns.despine(ax=ax)


ax_bot.set_xlabel("Percent identity (%)")

ax_top.set_ylabel(None)
ax_bot.set_ylabel(None)

fig.supylabel(
    "Frequency",
    x=0.032
)

fig.subplots_adjust(
    left=0.16
)


# Broken Y-axis ranges

ymax = max(
    ax_top.get_ylim()[1],
    ax_bot.get_ylim()[1]
)

ax_bot.set_ylim(
    0,
    max(1, ymax * 0.05)
)

ax_top.set_ylim(
    ymax * 0.80,
    ymax
)


# Broken-axis marks

ax_top.spines["bottom"].set_visible(False)
ax_bot.spines["top"].set_visible(False)

ax_top.tick_params(
    labeltop=False
)

ax_bot.xaxis.tick_bottom()

d = 0.015

kwargs = dict(
    transform=ax_top.transAxes,
    color="k",
    clip_on=False,
    linewidth=1.0
)

ax_top.plot(
    (-d, +d),
    (-d, +d),
    **kwargs
)

ax_top.plot(
    (1 - d, 1 + d),
    (-d, +d),
    **kwargs
)

kwargs.update(
    transform=ax_bot.transAxes
)

ax_bot.plot(
    (-d, +d),
    (1 - d, 1 + d),
    **kwargs
)

ax_bot.plot(
    (1 - d, 1 + d),
    (1 - d, 1 + d),
    **kwargs
)


fig.tight_layout()

fig.savefig(
    f"{args.outdir}/Figure_4C_percent_identity_histogram_brokenY.tif",
    dpi=DPI
)

plt.close(fig)

print(
    f"Figures saved to: {args.outdir}/"
)
