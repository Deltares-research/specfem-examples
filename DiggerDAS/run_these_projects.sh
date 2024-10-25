#!/bin/bash

# List of subfolder paths
subfolders=( "hol" "geen_hol" "bever_geluid" )

# Loop through each subfolder and run the script
for folder in "${subfolders[@]}"; do
    script_path="./$folder/run_this_project.sh"
    
    if [[ -f $script_path ]]; then
        echo "Entering directory: $folder"
        cd "$folder" || { echo "Failed to enter directory: $folder"; exit 1; }
		
		echo "Processing gmsh file"
		bash "process_the_Gmsh_file_once_and_for_all.sh"
        
        echo "Running $script_path..."
        bash "run_this_project.sh" | tee log.txt
        
        # Check if the previous command was successful
        if [[ $? -ne 0 ]]; then
            echo "Error occurred while running $script_path. Exiting."
            exit 1
        fi
        
        # Go back to the main script directory
        cd - || exit
    else
        echo "Script not found: $script_path"
    fi
done

echo "All scripts executed."
