#!/bin/bash
sudo service mongodb start

source /home/mgkit/mgkit-env/bin/activate

jupyter notebook --ip=0.0.0.0 $@
