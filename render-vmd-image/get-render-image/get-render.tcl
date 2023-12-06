# load molecule
#mol new 3_run.gro

# delete previous selection:
#animate delete all

#
#sel [atomselect list] {$sel delete} 

####################################
# first representation:
# this is an imput:
mol modselect 0 top "resname SiO2"
mol modstyle 0 top VDW 1.0 12
mol addrep top
####################################

####################################
# second representation:
mol modselect 1 top "waters"
mol modstyle 1 top Lines 1.0
mol addrep top
#####################################

# general display:
display depthcue off
display projection orthographic
display shadows on
display ambientocclusion on 
axes location lower left
#color Display Background white
pbc box
display rendermode Normal
display aoambient 0.75
display aodirect 0.75

# rotate:
rotate x by -80
rotate y by -10
#rotate z by 10

# camara distance:
scale by 1.4

# set background to transparent
#sbackground {rgbt <0,0,0,0>}

# render
render POV3 image.pov povray +W%w +H%h -I%s -O%s.png +X +A +FT +UA
#render POV3 image.pov povray +W%w +H%h -I%s -O%s.tga +X +A +FT +UA
#render POV3 image.pov "/usr/bin/povray" +W%w +H%h -I%s -O%s.tga +X +A +FT +UA
#render POV3 image.pov povray +W%w +H%h -I%s -O%s.tga +X +A +FT +UA

# exit from VMD
exit

#render POV3 image.pov povray +W%w +H%h -I%s -O%s.png +X +A +FT +UA
#render POV3 image "usr/bin//povray" +W%w +H%h -I%s -O%s.png +X +A +FT +UA
#solution:
#https://askubuntu.com/questions/628496/using-pov-ray-installed-via-the-apt

