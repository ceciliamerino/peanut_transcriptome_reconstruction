# Removal of residual fungal sequences

This directory documents the identification and removal of residual *Thecaphora frezzii*-derived transcripts from EvidentialGene-curated peanut transcriptomes.

Fungal-sequence filtering was performed after EvidentialGene curation in both transcriptome reconstruction strategies.

## Subread index construction

Before alignment, a Subread index was built from the *T. frezzii* reference genome assembly ASM2628400v1 (GCA_026284005.1) using `subread-buildindex`.

A generalized implementation is provided in:

`subread_buildindex.sh`

## Read-classification-based reconstruction

EvidentialGene-curated transcriptomes (`*.okay.mrna`) were aligned against the *T. frezzii* reference genome using Subread v2.0.6.

The Subread alignment used:

- 10 threads
- `-t 0`
- BAM output

The corresponding implementation is provided in:

`subread_alignment_read_classification.sh`

The BAM alignment output was converted to SAM format using SAMtools before transcript filtering using:

`samtools view input.bam > output.sam`

A generalized implementation is provided in:

`bam_to_sam.sh`

## Genome-guided reconstruction

EvidentialGene-curated genome-guided transcriptomes were aligned against the *T. frezzii* reference genome using Subread v2.0.6.

The recovered alignment command used:

- 10 threads
- `-t 1`
- `--SAMoutput`

Therefore, SAM output was generated directly by Subread.

The corresponding implementation is provided in:

`subread_alignment_genome_guided.sh`

## Transcript filtering

For both reconstruction strategies, fungal-mapping transcript identifiers were used to remove residual *T. frezzii*-derived sequences from the EvidentialGene-curated transcriptomes.

The filtering scripts were applied sequentially:

1. `01_filter_sam_flags.py` — retains alignment records whose FLAG value is not exactly `4`, preserving the filtering logic used in the original analysis.
2. `02_extract_transcript_ids.py` — extracts transcript identifiers from the first column of the filtered alignment file.
3. `03_filter_fasta_by_ids.py` — removes sequences whose identifiers occur in the exclusion list from the EvidentialGene-curated FASTA file.

The scripts were generalized only for input/output file handling; their original filtering logic was preserved.

The resulting filtered transcript sets were used as the final peanut transcriptomes for downstream quality assessment and coding-sequence prediction.

## Scripts

- `subread_buildindex.sh` — builds the Subread index from the *T. frezzii* reference genome.
- `subread_alignment_read_classification.sh` — aligns read-classification-based EvidentialGene-curated transcriptomes against the *T. frezzii* genome.
- `bam_to_sam.sh` — converts Subread BAM output to SAM format for downstream filtering.
- `subread_alignment_genome_guided.sh` — aligns genome-guided EvidentialGene-curated transcriptomes against the *T. frezzii* genome and generates SAM output directly.
- `01_filter_sam_flags.py` — filters SAM alignment records according to the FLAG criterion used in the original analysis.
- `02_extract_transcript_ids.py` — extracts transcript identifiers from filtered alignment records.
- `03_filter_fasta_by_ids.py` — removes fungal-mapping transcript identifiers from the curated peanut transcriptome.
