#!/usr/bin/env python3

import pandas as pd
import sys

def excel_to_csv(excel_file):
    # Load the entire Excel file
    xls = pd.ExcelFile(excel_file)

    # Loop through each sheet in the Excel file
    for sheet_name in xls.sheet_names:
        # Read the specific sheet
        df = xls.parse(sheet_name)
        
        # Create a CSV filename based on the Excel filename and sheet name
        csv_file = f"{excel_file.split('.')[0]}_{sheet_name}.csv"
        
        # Save the DataFrame to a CSV file
        df.to_csv(csv_file, index=False)
        print(f"Saved {csv_file}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide an Excel filename as an argument.")
        sys.exit(1)
    
    excel_file = sys.argv[1]
    excel_to_csv(excel_file)
