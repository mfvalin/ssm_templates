#!/bin/bash
Here=$(readlink -e $0)
Here=${Here%/maint*}
Package=${Here##*/}
echo ==  ${Package} home is $Here ===
cd $Here || exit 1
cd Build || exit 1
make install || exit 1
make clean
echo === source published under ${Here}/src ===
