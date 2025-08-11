""" build_image.py

This script converts a PDF file into an image format (PNG). It uses the 
`pdf2image` library to process the PDF and save the resulting images. The 
script accepts a PDF file path as a command-line argument and outputs the 
converted image(s) to the specified directory.

Usage:
    python build_image.py -f <path_to_pdf_file>
    
Arguments:
    -f, --file : str
        Required. Path to the PDF file to be converted.
    -h, --help :
        Show this help message and exit.
        
Functionality:
    - Parses the command-line arguments to get the PDF file path.
    - Uses a temporary directory to process the PDF file.
    - Converts the PDF into images with a resolution of 600 DPI.
    - Saves the resulting images in PNG format in the `./obj/` directory.
    
Dependencies:
    - argparse
    - tempfile
    - pdf2image
    
Note:
    Ensure that the `pdf2image` library is installed and properly configured 
    with the required dependencies (e.g., `poppler` for PDF rendering).
"""

import argparse
import tempfile
from pdf2image import convert_from_path

# Set up argument parser
parser = argparse.ArgumentParser(description="Convert a PDF file to an image.")
parser.add_argument(
    '-f', '--file', 
    required=True, 
    help="Path to the PDF file to be converted."
)
args = parser.parse_args()

# Process the PDF file
with tempfile.TemporaryDirectory() as path:
    images_from_path = convert_from_path(
        args.file, 
        dpi=600,
        output_folder="./"
    )
    for ims in images_from_path:
        output_file = args.file.replace('.pdf', '.png')
        ims.save(output_file)
