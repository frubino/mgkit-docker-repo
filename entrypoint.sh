#!/bin/bash
sudo service mongodb start

# Necessary for the current version of the click Python package
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

source /home/mgkit/mgkit-env/bin/activate

jupyter notebook --ip=0.0.0.0 $@
