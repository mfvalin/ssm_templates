#!/bin/bash
Here=$(readlink -e $0)
Here=${Here%/maint*}
Package=${Here##*/}
echo ==  ${Package} home is $Here ===
cd $Here || exit 1
#[[ -d Build ]] || git clone https://github.com/mfvalin/vgrid Build
cd Build || exit 1
git checkout  collaboration_6.4 || exit 1
cd src || exit 1
make install  LIBRMNSHARED=${1:-rmnshared} || exit 1
make clean
mkdir -p ${Here}/src
[[ -d ${Here}/src ]] || exit 1
rsync -aurvxlH . ${Here}/src/.
echo === source published under ${Here}/src ===
