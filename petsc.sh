#!/usr/bin/bash

set -xe
cd /tmp/
# Build PETSc
tar -xzf petsc.tar.gz
rm petsc.tar.gz
cd `ls | grep petsc`

./configure PETSC_ARCH=dorcker-gnu-opt \
            --prefix=/opt/petsc \
            --with-blas-lib=/opt/OpenBLAS/libopenblas.so \
            --with-lapack-lib=/opt/OpenBLAS/libopenblas.so \
            --download-mpich \
            --download-superlu_dist \
            --download-parmetis \
            --download-hypre \
            --with-debugging=0 COPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            CXXOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            FOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2'

make PETSC_DIR=/opt/petsc PETSC_ARCH=dorcker-gnu-opt
make install
cd /
rm -rf /tmp/*
