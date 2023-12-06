#!/bin/bash

############################################
# notes                                    #
# 1. read a .gro file                      #
# 2. read a render script (vmd)            #
# 3. convert image from *.tga to *.png     #
# 4. trim the figure with convert          #
############################################
# this is how the scrip function:          #
#                                          #
# bash run.sh -f 3_run.gro                 #
#                                          #
############################################

# Parse command line arguments
while getopts "f:" opt; do
  case ${opt} in
    f )
      filename=${OPTARG}
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument." 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Check if filename is set
if [ -z "${filename}" ]; then
  echo "Usage: $0 -f filename.gro" 1>&2
  exit 1
fi

# vmd
vmd "${filename}" -e get-render.tcl

# convert figure to png
convert image.pov.png.tga image.png

# trim figure
convert -trim image.png image.png 

exit
