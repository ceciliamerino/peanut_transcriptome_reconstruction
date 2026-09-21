# Removal of residual fungal sequences

This directory documents the identification and removal of residual *Thecaphora frezzii*-derived transcripts from EvidentialGene-curated peanut transcriptomes.

Fungal-sequence filtering was performed after EvidentialGene curation in both transcriptome reconstruction strategies.

## Read-classification-based reconstruction

EvidentialGene-curated transcriptomes (`*.okay.mrna`) were aligned against the *Thecaphora frezzii* reference genome using Subread v2.0.6.

The recovered original command used:

- 10 threads
- `-t 0`
- BAM output

The corresponding implementation is provided in:

`subread_alignment_read_classification.sh`

## Genome-guided reconstruction

EvidentialGene-curated genome-guided transcriptomes were also aligned against the *T. frezzii* reference genome using Subread v2.0.6.

The recovered original command used:

- 10 threads
- `-t 1`
- `--SAMoutput`

The corresponding implementation is provided in:

`subread_alignment_genome_guided.sh`

## Transcript filtering

For both reconstruction strategies, fungal-mapping transcript identifiers were used to remove residual *T. frezzii*-derived sequences from the EvidentialGene-curated transcriptomes.

The recovered filtering scripts were applied sequentially:

1. `01_filter_sam_flags.py` — retains alignment records whose FLAG value is not exactly `4`, preserving the filtering logic used in the original analysis.
2. `02_extract_transcript_ids.py` — extracts transcript identifiers from the first column of the filtered alignment file.
3. `03_filter_fasta_by_ids.py` — removes sequences whose identifiers occur in the exclusion list from the EvidentialGene-curated FASTA file.

The scripts were generalized only for input/output file handling; their original filtering logic was preserved.

For the read-classification-based workflow, the original Subread alignment produced BAM output. The exact intermediate command used to prepare the alignment text processed by the filtering scripts has not yet been recovered.

The resulting filtered transcript sets were used as the final peanut transcriptomes for downstream quality assessment and coding-sequence prediction.
