FROM ubuntu:latest

# Build essentials
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y dialog apt-utils
RUN apt-get install -y build-essential

# Install vim
RUN apt-get install -y vim
# Python3 requirements
RUN apt-get install -y python3-dev python3-venv mercurial
RUN apt-get install -y python3-pip

# Proj4, GEOS (Cartopy deps)
RUN apt-get install -y libproj-dev proj-bin libgeos-dev

# MongoDB
RUN apt-get install -y mongodb

# Adds user and set it as a sudoer (to run the mongodb service)
RUN apt-get install -y sudo
RUN adduser --disabled-password --gecos "" mgkit
RUN adduser mgkit sudo
# no password for sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# Switch to user
USER mgkit
WORKDIR /home/mgkit
RUN python3 -m venv mgkit-env
ADD --chown=mgkit bootstrap.sh /home/mgkit/
RUN chmod +x /home/mgkit/bootstrap.sh
RUN ./bootstrap.sh

# Setup the entrypoint
ADD --chown=mgkit entrypoint.sh /home/mgkit/
RUN chmod +x /home/mgkit/entrypoint.sh

EXPOSE 8888

CMD ./entrypoint.sh
