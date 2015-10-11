FROM canesin/openblas-git:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

# Install PETSc from latest stable
ADD petsc.sh /petsc.sh
ADD http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz /tmp/petsc.tar.gz
RUN bash /petsc.sh && rm /petsc.sh
