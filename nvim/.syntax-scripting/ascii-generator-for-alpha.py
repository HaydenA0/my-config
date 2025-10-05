#!/usr/bin/env python3

import os


def format_ascii_art(filename="asciiart.txt"):
    """
    Reads ASCII art from a file and prints it in a specific
    dashboard-like format to the console.

    Args:
        filename (str): The name of the file containing the ASCII art.
    """
    try:

        with open(filename, "r", encoding="utf-8") as f:
            lines = f.readlines()

        if not lines:
            print(f"Warning: The file '{filename}' is empty.")
            return

        cleaned_lines = [line.rstrip() for line in lines]

        print("\t\tdashboard.section.header.val = {")

        num_lines = len(cleaned_lines)

        for i, line in enumerate(cleaned_lines):

            prefix = "\t\t\t[["

            suffix = "]]"

            if i == num_lines - 1:
                print(f"{prefix}{line}{suffix}")

            else:
                print(f"{prefix}{line}{suffix},")

        print("\t\t}")

    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
        print("Please make sure the file exists in the same directory as the script.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


if __name__ == "__main__":
    format_ascii_art()
