#!/usr/bin/bash

set -xe
cd /tmp/
# Build PETSc
tar -xzf petsc.tar.gz
rm petsc.tar.gz
cd `ls | grep petsc`

python2.7 configure PETSC_ARCH=dorcker-gnu-opt \
            --prefix=/opt/petsc \
            --with-blas-lapack-dir=/opt/OpenBLAS/lib \
            --download-mpich \
            --with-debugging=0 COPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            CXXOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            FOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2'

make PETSC_DIR=/opt/petsc PETSC_ARCH=dorcker-gnu-opt
make install
cd /
rm -rf /tmp/*
