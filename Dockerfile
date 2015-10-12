FROM canesin/openblas-git:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

# Update image and install required packages
RUN yum -y update
RUN yum -y install \
    make \
    cmake \
    perl \
    unzip \
    gcc \
    gcc-c++ \
    gcc-gfortran

# Install PETSc from latest stable
ADD petsc.sh /petsc.sh
ADD http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz /tmp/petsc.tar.gz
RUN bash /petsc.sh && rm /petsc.sh

# Finalize by cleaning
RUN yum -y remove \
    make \
    cmake \
    perl \
    unzip \
    gcc \
    gcc-c++ \
    gcc-gfortran

RUN yum -y clean all
