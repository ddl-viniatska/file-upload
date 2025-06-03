#!/bin/bash

# Get data path from input or use default
DATA_PATH="${1:-/mnt}"
echo "Running bias check with data path: $DATA_PATH"

# Create output folder
OUTPUT_DIR="./bias_check_outputs"
mkdir -p "$OUTPUT_DIR"

# Run Python script to generate outputs, passing the bash variable as an env var
python3 - <<EOF
import os
import matplotlib.pyplot as plt

data_path = "${DATA_PATH}"
output_dir = "${OUTPUT_DIR}"

# Create a dummy text report
report_path = os.path.join(output_dir, "bias_report.txt")
with open(report_path, "w") as f:
    f.write("Bias check complete.\\n")
    f.write(f"Data path: {data_path}\\n")
    f.write("No significant bias detected.\\n")

# Create a dummy plot
plt.figure(figsize=(6, 4))
categories = ['Group A', 'Group B']
values = [0.45, 0.55]
plt.bar(categories, values, color=['blue', 'green'])
plt.title('Bias Distribution')
plt.ylabel('Proportion')
plt.savefig(os.path.join(output_dir, "bias_plot.png"))

print("Generated:")
print(f" - {report_path}")
print(f" - {os.path.join(output_dir, 'bias_plot.png')}")
EOF
