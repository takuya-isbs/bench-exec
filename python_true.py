#!/usr/bin/env python3

import subprocess
import sys

def main():
    try:
        result = subprocess.run(["true"], check=False)
        sys.exit(result.returncode)
    except FileNotFoundError:
        print("Error: 'true' command not found.", file=sys.stderr)
        print("Please ensure 'true' is in your system's PATH.", file=sys.stderr)
        sys.exit(127)

    except Exception as e:
        print(f"An unexpected error occurred: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
