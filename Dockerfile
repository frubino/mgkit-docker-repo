# starting from Ubuntu 20.04 
FROM ubuntu:focal

RUN apt update
RUN apt install -y wget
RUN apt autoremove -y
RUN adduser --disabled-password --gecos "" mgkit

# Switch to user
USER mgkit
WORKDIR /home/mgkit

ENV SHELL /bin/bash
ENV CONDA_DIR ./miniconda/
RUN wget -O Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR

ENV PATH $CONDA_DIR/bin:$PATH
ARG MGKIT_VERSION=0.5.8
RUN conda create -n mgkit -c frubino -c bioconda -c conda-forge -c default mgkit==${MGKIT_VERSION}
RUN conda clean -a -y
ENV PATH /home/mgkit/miniconda/envs/mgkit/bin/:$PATH
