#!/usr/bin/env python3

import os
import sys

def list_folders(directory):
    if not os.path.exists(directory):
        print(f"Error: '{directory}' does not exist.")
        sys.exit(1)
    if not os.path.isdir(directory):
        print(f"Error: '{directory}' is not a directory.")
        sys.exit(1)

    print(f"Folders in '{directory}':")
    for item in os.listdir(directory):
        full_path = os.path.join(directory, item)
        if os.path.isdir(full_path):
            print(item)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: {sys.argv[0]} <directory_path>")
        sys.exit(1)

    target_dir = sys.argv[1]
    list_folders(target_dir)

