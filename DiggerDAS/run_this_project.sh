bin/bash
#
# script runs mesher and solver (in serial)
# using this project setup
#

echo "running example: `date`"
currentdir=`pwd`

# sets up directory structure in current example directoy

# project can be outside the specfem folder but should contain:
# 1. DATA folder with Par_file and SOURCE file
# 2. MESH folder with a project.geo file
# 3. process_the_Gmsh_file_once_and_for_all.sh - should refer to project.geo file and the path to python script should include SPECFEM2D_ROOT

echo
echo "setting up project..."
echo

mkdir -p OUTPUT_FILES

# cleans output files
rm -rf OUTPUT_FILES/*

cd $currentdir

# links executables
mkdir -p bin
cd bin/
rm -f xmeshfem2D xspecfem2D
ln -s $SPECFEM2D_ROOT/bin/xmeshfem2D  
ln -s $SPECFEM2D_ROOT/bin/xspecfem2D
cd ../

# stores setup
cp DATA/Par_file OUTPUT_FILES/
cp DATA/SOURCE OUTPUT_FILES/

# Get the number of processors
NPROC=`grep ^NPROC DATA/Par_file | cut -d = -f 2 | cut -d \# -f 1 | tr -d ' '`

# runs database generation
if [ "$NPROC" -eq 1 ]; then
  # This is a serial simulation
  echo
  echo "running mesher..."
  echo
  ./bin/xmeshfem2D
else
  # This is a MPI simulation
  echo
  echo "running mesher on $NPROC processors..."
  echo
  mpirun -np $NPROC ./bin/xmeshfem2D
fi
# checks exit code
if [[ $? -ne 0 ]]; then exit 1; fi

# runs simulation
if [ "$NPROC" -eq 1 ]; then
  # This is a serial simulation
  echo
  echo "running solver..."
  echo
  ./bin/xspecfem2D
else
  # This is a MPI simulation
  echo
  echo "running solver on $NPROC processors..."
  echo
  mpirun -np $NPROC ./bin/xspecfem2D
fi
# checks exit code
if [[ $? -ne 0 ]]; then exit 1; fi

# stores output
cp DATA/*SOURCE* DATA/*STATIONS* OUTPUT_FILES

# check mesh
cd bin/
rm -f xcheck_quality_external_mesh
ln -s $SPECFEM2D_ROOT/bin/xcheck_quality_external_mesh
cd ../

./bin/xcheck_quality_external_mesh <<EOF
3
EOF
# checks exit code
if [[ $? -ne 0 ]]; then exit 1; fi

echo
echo "see results in directory: OUTPUT_FILES/"
echo
echo "done"
echo `date`

