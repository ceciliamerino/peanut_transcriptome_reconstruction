#!/usr/bin/env python3

import argparse


def filter_fasta(fasta_file, query_file, output_file):
    """
    Filter a FASTA file by excluding sequences whose identifiers
    are present in the query file.
    """

    # Read sequence identifiers to exclude
    with open(query_file, "r") as query:
        exclude_names = {line.strip() for line in query}

    write_sequence = True
    current_sequence = []

    with open(fasta_file, "r") as fasta_in, open(output_file, "w") as fasta_out:

        for line in fasta_in:

            if line.startswith(">"):

                # Write the previous sequence if it was retained
                if current_sequence:
                    if write_sequence:
                        fasta_out.write("".join(current_sequence))

                    current_sequence = []

                # Extract the sequence identifier from the FASTA header
                header_name = line[1:].split()[0]

                # Exclude sequence if its identifier occurs in the query file
                write_sequence = header_name not in exclude_names

            current_sequence.append(line)

        # Write the final sequence if retained
        if current_sequence and write_sequence:
            fasta_out.write("".join(current_sequence))


def main():
    parser = argparse.ArgumentParser(
        description="Filter FASTA sequences using a file containing identifiers to exclude."
    )

    parser.add_argument(
        "-i", "--input",
        required=True,
        help="Input FASTA file"
    )

    parser.add_argument(
        "-q", "--query",
        required=True,
        help="File containing sequence identifiers to exclude"
    )

    parser.add_argument(
        "-o", "--output",
        required=True,
        help="Filtered output FASTA file"
    )

    args = parser.parse_args()

    filter_fasta(
        args.input,
        args.query,
        args.output
    )


if __name__ == "__main__":
    main()
