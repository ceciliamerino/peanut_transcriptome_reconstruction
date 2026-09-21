#!/usr/bin/env python3

import argparse


def main():
    parser = argparse.ArgumentParser(
        description="Extract transcript identifiers from the first column of the filtered alignment file."
    )

    parser.add_argument(
        "-i", "--input",
        required=True,
        help="Input filtered alignment file"
    )

    parser.add_argument(
        "-o", "--output",
        required=True,
        help="Output file containing transcript identifiers"
    )

    args = parser.parse_args()

    with open(args.input, "r") as input_file, open(args.output, "w") as output_file:

        for line in input_file:
            transcript_id = line.strip().split("\t")[0]
            output_file.write(transcript_id + "\n")


if __name__ == "__main__":
    main()
