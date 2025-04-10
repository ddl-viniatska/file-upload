import sys

def print_text():
    if len(sys.argv) > 1:
        print("\n".join(sys.argv[1:]))
    else:
        print("No text provided.")

if __name__ == "__main__":
    print_text()
