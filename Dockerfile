FROM canesin/openblas-git:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Install PETSc from latest stable
ADD petsc.sh /petsc.sh
ADD http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz /tmp/build/petsc.tar.gz
RUN bash /petsc.sh && rm /petsc.sh

# Finalize by cleaning
RUN apt-get autoremove -y
RUN apt-get clean -y
