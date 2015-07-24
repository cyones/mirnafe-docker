FROM ubuntu:14.04
MAINTAINER Cristian A. Yones <cyones@sinc.unl.edu.ar>

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y \
software-properties-common \
python-software-properties \
wget

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:j-4/vienna-rna -y
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y vienna-rna

COPY clustalo /usr/bin/

COPY install_phast.sh /
RUN sh install_phast.sh
    
RUN DEBIAN_FRONTEND=noninteractive apt-get -y clean && -y apt-get autoclean

CMD RNAfold --version && \
    clustalo --version && \
    phyloFit --help
