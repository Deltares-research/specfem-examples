#!/bin/bash

# script clears all the files that were produced by 
#(1) process_the_Gmsh_file_once_and_for_all.sh 
#(2) run_this_project

rm -rf bin
echo "binary links removed"

rm -rf OUTPUT_FILES
echo "OUTPUT_FILES removed..."

rm DATA/STATIONS


# Define the target directory
TARGET_DIR="MESH"

# Check if the directory exists
if [ -d "$TARGET_DIR" ]; then
    # Find and remove files that are not the specified ones
    find "$TARGET_DIR" -type f ! -name 'nummaterial_velocity_file' ! -name '*.geo' -exec rm -f {} +
else
    echo "Directory $TARGET_DIR does not exist."
fi

rm *.dx
rm log.txt
find . -type f -name '*.Identifier' -exec rm {} +

echo "all outfiles from meshing and running removed.."
