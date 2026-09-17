# Coding-sequence prediction

This directory documents coding-sequence prediction from the final peanut transcriptomes.

Open reading frames (ORFs) were predicted from the final read-classification-based and genome-guided transcriptomes using TransDecoder v5.7.1.

## Candidate ORF identification

Candidate coding regions were identified using:

`TransDecoder.LongOrfs`

## Protein homology search

Predicted peptide sequences were searched against the NCBI non-redundant protein database using DIAMOND BLASTp v2.1.10.

The search was configured to report up to one target sequence per query:

`--max-target-seqs 1`

## Final ORF prediction

Protein homology evidence was incorporated into:

`TransDecoder.Predict`

using:

`--retain_blastp_hits`

Final coding-sequence prediction was performed using:

`--single_best_only`

to retain a single best ORF prediction per transcript.
