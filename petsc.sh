#!/usr/bin/bash

set -xe
cd /tmp/
# Build PETSc
tar -xzf petsc.tar.gz
rm petsc.tar.gz
cd `ls | grep petsc`

./configure PETSC_ARCH=dorcker-gnu-opt \
            --prefix=/opt/petsc \
            --with-blas-lapack-lib=/opt/OpenBLAS/lib/libopenblas.a \
            --with-cxx-dialect=C++11 \
            --download-mpich \
            --download-superlu_dist \
            --download-metis \
            --download-parmetis \
            --download-hypre \
            --with-debugging=0 \
            COPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            CXXOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' \
            FOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2'

make
make install
cd /
rm -rf /tmp/*
