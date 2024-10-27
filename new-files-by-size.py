#!/usr/bin/env python3

from pathlib import Path
from datetime import datetime, timedelta

# Define the target directory and time frame
target_directory = Path(".")  # Replace with the path you want to search
time_threshold = datetime.now() - timedelta(days=3)

# Get all .mkv files in the directory recursively
mkv_files = [
    {
        "FullName": str(file.resolve()),
        "Length": file.stat().st_size,
        "LastWriteTime": datetime.fromtimestamp(file.stat().st_mtime)
    }
    for file in target_directory.rglob("*.mkv")
    if datetime.fromtimestamp(file.stat().st_mtime) > time_threshold
]

# Sort files by Length
mkv_files_sorted = sorted(mkv_files, key=lambda x: x["Length"])

# Display formatted header with adjusted column width
print(f"{'FullName':<80} {'Length':>15} {'LastWriteTime'}")
print(f"{'-'*80} {'-'*15} {'-'*13}")

# Display each file in formatted columns
for file_info in mkv_files_sorted:
    # Format the last write time
    last_write_time = file_info["LastWriteTime"].strftime("%m/%d/%Y %H:%M:%S")
    print(f"{file_info['FullName']:<80} {file_info['Length']:>15} {last_write_time}")
