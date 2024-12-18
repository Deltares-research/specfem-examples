# specfem-examples
Spectral element acoustic-elastic simulations used in Deltares projects

## Installation of SPECFEM2D

   Navigate to folder where you would like to clone and install specfem2d (in my case gitclones folder) and clone:

   ```
   cd ~/gitclones
   git clone https://github.com/SPECFEM/specfem2d.git
   ```
   
   Now copy the pixi.toml in the SPECFEM2D folder run (don't run in specfem-examples, this is just a repository of projects):
   ```
   pixi run install
   exec bash
   ```
   To test the install run:
   ```
   pixi run example
   ```

## Generate MESH files
Now return to your project folder (e.g. the template example) kaas

    ```
    cd ~gitclones/specfem-examples/Template_Gmsh_MPI
    ./process_the_Gmsh_file_once_and_for_all.sh
    ```

## Run Simulation

You can run the simulation by:

    run_this_project.sh

## Remove the generated mesh and OUTPUT_FILES, type:
	```
	./clear_run.sh
    ```

## Start your own project
You can use the Template_Gmsh_MPI to setup your own project, for this you need to update the following files

- MESH/*.geo -- create you schematization in gmesh.
- MESH/nummaterial_velocity_file -- set acoustic/elastic and refer to the M1 to Mn materials from your .geo file
- DATA/Par_file -- this is your main parameter file (including receiver locations and settings)
- DATA/SOURCE -- here you set your source location and type 

If this is al done correctly you can back to the steps 'Generate MESH files' and 'Run Simulation'

## Troubleshooting
Often when you run into errors, file paths are not set correctly in the Par_file, it is easiest to keep the name of the .geo file always the same to avoid this, e.g. schema.geo.

Negative jacobian error is always related to the mesh. Make sure your line loops are all counterclockwise. Take into account in which direction your lines are defined. It is ok to use negative numbers to get the right directions. If this still does not work also try to decrease your cell size (lc parameter).

Floating point errors indicate bad conditioning. You might have to lower your DT value. The code indicates this. Look for the section that includes CFL and adjust according to recommendations.
- For each run check if the CFL is in the is close to but below 0.5 (lowering the DT value lowers this number, but also lowering the cell size in your mesh set in the (.geo file) and also lowering the highest Vp in the model (nummaterial_velocity file)
- For each run check if the lowest number in the 'histogram of min number of points per S wavelength in solid regions' is higher than 5 (changing the source frequency changes this number)
- It is good practice to include CFL and min points per wavelength in your simluations logbook