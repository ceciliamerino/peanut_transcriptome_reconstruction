# Read preprocessing

This directory contains the scripts used during RNA-seq preprocessing.

Raw paired-end reads were processed using Clumpify, fastp, and Repair from the BBTools suite. Clumpify and fastp were executed directly using their corresponding command-line tools. The script provided here was used to restore paired-end read correspondence with Repair after preprocessing.

## Scripts

- `repair_reads.sh` — restores paired-end read correspondence after preprocessing.
