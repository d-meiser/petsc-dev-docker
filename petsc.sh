#!/usr/bin/bash
set -xe
cd /tmp/

# Build PETSc
PETSC_DIR=`ls | grep petsc`
echo "PETSC_DIR == $PETSC_DIR"
cd $PETSC_DIR

OPT_FLAGS="-O2 -ffast-math -march=corei7-avx -mtune=corei7-avx"

./configure PETSC_ARCH=docker-gnu-opt \
            --prefix=/opt/petsc \
            --with-clanguage=c \
            --with-pthread=0 \
            --with-mpiuni-fortran-bindings=0 \
            --with-ssl=0 \
            --with-shared-libraries=1 \
            --download-mpich=1 \
            --download-fblaslapack=1 \
            --with-fortran-kernels=0 \
            --with-debugging=0 \
            COPTFLAGS=${OPT_FLAGS} \
            CXXOPTFLAGS=${OPT_FLAGS} \
            FOPTFLAGS=${OPT_FLAGS}

make
make install

# Add PETSC_DIR to env variables of container
echo "export PETSC_DIR=/opt/petsc" >> $HOME/.bashrc
source $HOME/.bashrc

# Clean files
cd /
rm -rf /tmp/*
