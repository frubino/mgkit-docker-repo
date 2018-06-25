#!/bin/bash
source /home/mgkit/mgkit-env/bin/activate

#clone repository
hg clone https://setsuna80@bitbucket.org/setsuna80/mgkit mgkit-repo
cd mgkit-repo
# update at the latest branch
hg update develop
pip install -e .

# Install from PyPI
# pip install mgkit

# Install tests modules
pip install pytest-datadir pytest-console-scripts

# Extras
pip install seaborn Cython

# Cartography and so on
pip install cartopy shapely descartes fiona geopandas networkx

# Install jupyter
cd $HOME
pip install jupyter bash-kernel
# install the bash kernel
python -m bash_kernel.install
