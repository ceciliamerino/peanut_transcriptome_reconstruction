#!/usr/bin/env python3

import argparse


def main():
    parser = argparse.ArgumentParser(
        description="Filter SAM records according to the FLAG value used in the original analysis."
    )

    parser.add_argument(
        "-i", "--input",
        required=True,
        help="Input SAM-format text file"
    )

    parser.add_argument(
        "-o", "--output",
        required=True,
        help="Output file containing retained SAM records"
    )

    args = parser.parse_args()

    with open(args.input, "r") as input_file, open(args.output, "w") as output_file:

        for line in input_file:
            try:
                flag = line.strip().split("\t")[1]

                # Preserve the filtering logic used in the original analysis:
                # records with FLAG exactly equal to 4 are excluded.
                if flag != "4":
                    output_file.write(line)

            except (IndexError, ValueError):
                print("Could not parse line as tab-delimited SAM record")


if __name__ == "__main__":
    main()
