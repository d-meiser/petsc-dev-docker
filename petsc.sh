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
            COPTFLAGS='-O2 -march=core-avx-i -mtune=corei7-avx' \
            CXXOPTFLAGS='-O2 -march=core-avx-i -mtune=corei7-avx' \
            FOPTFLAGS='-O2 -march=core-avx-i -mtune=corei7-avx'

make
make install

# Add PETSC_DIR to env variables of container
echo "export PETSC_DIR=/opt/petsc" >> $HOME/.bash_profile
source $HOME/.bash_profile

# Clean files
cd /
rm -rf /tmp/*
