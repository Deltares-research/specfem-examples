#!/bin/bash
#
# script runs mesher and solver (in serial)
# using this example setup
#  ...

echo "running example: `date`"
#currentdir=`pwd`

echo
echo "(will take a few minutes)"
echo

# sets up directory structure in current example directoy
echo
echo "   setting up example..."
echo



for i in {1..17}; do
  cp -r ALL_SOURCES/SOURCE_$i DATA/SOURCE
  ./run_this_example.sh
  mkdir results"$i"
  cp -r OUTPUT_FILES results"$i" 
done 


#./run_this_example.sh
#cp -r OUTPUT_FILES RESULTS 
#echo



