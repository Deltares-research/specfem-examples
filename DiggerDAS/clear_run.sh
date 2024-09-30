#!/bin/bash

# script clears all the files that were produced by 
#(1) process_the_Gmsh_file_once_and_for_all.sh 
#(2) run_this_project

rm -rf bin
echo "binary links removed"

rm -rf OUTPUT_FILES
echo "OUTPUT_FILES removed..."

rm DATA/STATIONS
echo "STATIONS file from DATA directory removed..."


for file in ./MESH/*; do
  # Check if it's a file and does not have the .geo extension
  if [[ -f "$file" && "${file##*.}" != "geo" ]]; then
    # Remove the file
    rm "$file"
  fi
done

echo "all files in MESH removed except for .geo file..."
