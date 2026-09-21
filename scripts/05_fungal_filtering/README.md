# Removal of residual fungal sequences

This directory documents the identification and removal of residual *Thecaphora frezzii*-derived transcripts from EvidentialGene-curated peanut transcriptomes.

The filtering step was applied after EvidentialGene curation in both transcriptome reconstruction strategies.

## Read-classification-based reconstruction

EvidentialGene-curated transcriptomes (`*.okay.mrna`) were aligned against the *Thecaphora frezzii* reference genome using Subread v2.0.6.

The alignment command used:

- 10 threads
- `-t 0`
- BAM output

The corresponding implementation is provided in:

`subread_alignment_read_classification.sh`

## Genome-guided reconstruction

EvidentialGene-curated genome-guided transcriptomes were also aligned against the *T. frezzii* reference genome using Subread v2.0.6.

For this workflow, the documented alignment command used:

- 10 threads
- `-t 1`
- `--SAMoutput`

The corresponding implementation is provided in:

`subread_alignment_genome_guided.sh`

## Transcript filtering

For the genome-guided workflow, the recovered filtering scripts were applied sequentially to identify transcript IDs corresponding to fungal-mapping sequences and remove them from the EvidentialGene-curated FASTA files.

The recovered scripts are:

1. `01_filter_sam_flags.py` — retains alignment records whose FLAG value is not exactly `4`, preserving the filtering logic used in the original analysis.
2. `02_extract_transcript_ids.py` — extracts transcript identifiers from the first column of the filtered alignment file.
3. `03_filter_fasta_by_ids.py` — removes sequences whose identifiers occur in the exclusion list from the EvidentialGene-curated FASTA file.

These scripts were generalized only for input/output file handling; their filtering logic was preserved from the original analysis.

The resulting filtered transcript sets were considered the final peanut transcriptomes for downstream quality assessment and coding-sequence prediction.
