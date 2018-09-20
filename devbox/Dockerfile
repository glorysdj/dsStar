FROM ubuntu:18.04

MAINTAINER glorysdj

WORKDIR /opt/work

ENV JAVA_HOME		/opt/jdk
ENV PATH		${JAVA_HOME}/bin:${PATH}
ENV DEBIAN_FRONTEND     noninteractive

RUN apt-get update && \
    apt-get install -y --fix-missing curl nano wget unzip maven git

#java
RUN wget https://build.funtoo.org/distfiles/oracle-java/jdk-8u152-linux-x64.tar.gz && \
    gunzip jdk-8u152-linux-x64.tar.gz && \
    tar -xf jdk-8u152-linux-x64.tar -C /opt && \
    rm jdk-8u152-linux-x64.tar && \
    ln -s /opt/jdk1.8.0_152 /opt/jdk

#python
RUN apt install -y software-properties-common python-pkg-resources && \
    add-apt-repository -y ppa:jonathonf/python-3.6 && \
    apt install -y build-essential tcl tk gettext autoconf zlib1g-dev gcc python-dev python3-dev libcurl4-openssl-dev && \
    apt install -y python3-minimal && \
    apt install -y python3-pip && \
    pip3 install --upgrade setuptools && \
    pip3 install numpy scipy pandas scikit-learn matplotlib seaborn jupyter wordcloud moviepy requests opencv-python tensorflow && \
    python3 -m pip install ipykernel && \
    python3 -m ipykernel install --user
