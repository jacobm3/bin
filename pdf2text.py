#!/usr/bin/env

import PyPDF2
import sys

def extract_text_from_pdf(pdf_file):
    with open(pdf_file, 'rb') as file:
        reader = PyPDF2.PdfFileReader(file)
        text = ''
        for page_num in range(reader.numPages):
            page = reader.getPage(page_num)
            text += page.extractText()
    return text

def main():
    if len(sys.argv) != 2:
        print("Usage: python extract_text_from_pdf.py <pdf_file>")
        sys.exit(1)

    pdf_file = sys.argv[1]
    text = extract_text_from_pdf(pdf_file)
    print(text)

if __name__ == '__main__':
    main()
