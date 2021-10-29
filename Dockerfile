# starting from Ubuntu 20.04 
FROM ubuntu:focal

RUN apt update
RUN apt install -y wget git
RUN apt autoremove -y
RUN adduser --disabled-password --gecos "" mgkit

# Switch to user
USER mgkit
WORKDIR /home/mgkit

# Use bash as shell
ENV SHELL /bin/bash
# Install conda
ENV CONDA_DIR /home/mgkit/miniconda/
ENV PATH $CONDA_DIR/bin:$PATH
RUN wget -O Miniconda3-latest-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR
RUN rm Miniconda3-latest-Linux-x86_64.sh

# setup conda-build and the environment
ENV DOCKER_BUILD_DIR ${DOCKER_BUILD_DIR:-conda-build}
ENV DOCKER_PYTHON_VER ${DOCKER_PYTHON_VER:-3.8}
ENV MGKIT_VERSION ${MGKIT_VERSION:-0.5.8}
RUN mkdir -p ${DOCKER_BUILD_DIR}
RUN conda install conda-build conda-verify
WORKDIR /home/mgkit/package
COPY meta.yaml /home/mgkit/package/
# start
CMD conda-build -c bioconda -c conda-forge -c defaults --python=${DOCKER_PYTHON_VER} --output-folder ./${DOCKER_BUILD_DIR} .
