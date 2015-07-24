FROM ubuntu:14.04
MAINTAINER Cristian A. Yones <cyones@sinc.unl.edu.ar>

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y \
software-properties-common \
python-software-properties

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:j-4/vienna-rna -y && \
    echo "deb http://compgen.bscb.cornell.edu/phast/apt all free" >> /etc/apt/sources.list
    
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y \
    vienna-rna \
    clustalw \
    phast
    
RUN DEBIAN_FRONTEND=noninteractive apt-get -y clean && -y apt-get autoclean

CMD RNAfold --version && \
    clustalw2 --version && \
    phyloFit --help
