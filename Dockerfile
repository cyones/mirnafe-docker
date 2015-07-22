FROM ubuntu:14.04
MAINTAINER Cristian A. Yones <cyones@sinc.unl.edu.ar>

RUN apt-get update -y && apt-get install -y \
software-properties-common \
python-software-properties

RUN add-apt-repository ppa:j-4/vienna-rna -y && \
    echo "deb http://compgen.bscb.cornell.edu/phast/apt all free" >> /etc/apt/sources.list
    
RUN apt-get update -y && apt-get install -y \
    vienna-rna \
    clustalw \
    phast
    
RUN apt-get clean && apt-get autoclean

CMD RNAfold --version && \
    clustalw2 --version && \
    phyloFit --help
