#!/bin/bash

#inputs:
input_filename='2b4z.pdb'  # Cytochrome C
#input_filename='3rgk.pdb'  # Myoglobin
#input_filename='193l.pdb'  # Lysozyme C

##############################################################
# define TCL commands in a temporary file:
cat <<EOF > vmd_commands.tcl

# load molecule:
mol new $input_filename

# delete default representation
mol delrep 0 top

# representation:
mol selection {protein}
mol representation VDW 1.0 12
#mol representation Surf 1.4

# color:
#mol color ResType
#mol color Beta
mol color Name

mol addrep top

# general display:
display depthcue off
display projection orthographic
display shadows on
display ambientocclusion on
axes location off
#axes location lower left
#color Display Background white
#pbc box
display rendermode Normal
display aoambient 0.75
display aodirect 0.75

# rotate:
rotate x by 0
rotate y by 0
rotate z by 0

# camera distance:
scale by 1.4

# set background to transparent:
# sbackground {rgbt <0,0,0,0>}

# render:
render POV3 image.pov povray +W%w +H%h -I%s -O%s.png +X +A +FT +UA
EOF

# add the 'exit' command outside the VMD commands block:
echo "exit" >> vmd_commands.tcl

# execute VMD with the commands defined in the temporary file:
vmd -e vmd_commands.tcl

# delete the temporary file:
rm vmd_commands.tcl

# convert figure to png:
convert image.pov.png.tga image.png

# delete unnecessary files:
\rm image.pov.png.tga
\rm image.pov

# trim figure:
convert -trim image.png image.png 

