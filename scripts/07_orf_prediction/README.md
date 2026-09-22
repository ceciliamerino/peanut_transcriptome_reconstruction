# ORF prediction

This directory documents coding-sequence prediction for the final peanut transcriptomes generated using the read-classification-based and genome-guided reconstruction strategies.

The same ORF-prediction workflow was applied independently to the final transcriptome of each cultivar and reconstruction strategy.

## 1. Identification of candidate long ORFs

Candidate coding regions were first identified using TransDecoder.LongOrfs v5.7.1.

The recovered command was:

`TransDecoder.LongOrfs -t final_transcriptome.fasta`

This step generates candidate ORFs, including the `longest_orfs.pep` file used for subsequent protein-homology searches.

A generalized implementation is provided in:

`01_transdecoder_longorfs.sh`

## 2. Protein homology search with DIAMOND

Predicted peptide sequences from TransDecoder.LongOrfs were searched against the NCBI non-redundant protein database using DIAMOND BLASTp v2.1.10.

The recovered DIAMOND command used:

- `longest_orfs.pep` as query
- the NCBI nr protein database in DIAMOND format
- `--max-target-seqs 1`
- `--outfmt 6`
- 10 threads

The resulting tabular BLASTp output was subsequently used as protein-homology evidence during final ORF prediction.

A generalized implementation is provided in:

`02_diamond_blastp.sh`

## 3. Final coding-region prediction

Final ORF predictions were generated using TransDecoder.Predict v5.7.1.

Protein-homology evidence from the DIAMOND BLASTp search was retained using:

`--retain_blastp_hits`

A single best ORF prediction per transcript was retained using:

`--single_best_only`

The recovered command was equivalent to:

`TransDecoder.Predict -t final_transcriptome.fasta --retain_blastp_hits blastp.outfmt6 --single_best_only`

A generalized implementation is provided in:

`03_transdecoder_predict.sh`

TransDecoder generated final coding-sequence and protein predictions, including `.cds`, `.pep`, `.gff3`, and `.bed` output files.

## Workflow

Final transcriptome  
→ TransDecoder.LongOrfs  
→ `longest_orfs.pep`  
→ DIAMOND BLASTp against NCBI nr  
→ BLASTp homology evidence  
→ TransDecoder.Predict  
→ final predicted CDS and protein sequences

## Scripts

- `01_transdecoder_longorfs.sh` — identifies candidate long ORFs using TransDecoder.LongOrfs.
- `02_diamond_blastp.sh` — searches candidate peptide sequences against the NCBI nr protein database using DIAMOND BLASTp.
- `03_transdecoder_predict.sh` — performs final coding-region prediction using DIAMOND BLASTp homology evidence.
