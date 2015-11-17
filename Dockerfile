FROM centos:latest
MAINTAINER Dominic Meiser, dmeiser79@gmail.com

# Update image and install required packages
RUN yum -y update
RUN yum -y install \
    cmake \
    gcc \
    gcc-c++ \
    gcc-gfortran \
    git \
    make \
    perl

# Install PETSc from latest stable
ADD petsc.sh /petsc.sh
RUN git clone https://bitbucket.org/petsc/petsc /tmp/petsc
RUN bash /petsc.sh && rm /petsc.sh

# Finalize by cleaning
RUN yum -y remove \
    make \
    cmake \
    perl \
    gcc \
    gcc-c++ \
    gcc-gfortran

RUN yum clean all
