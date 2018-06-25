# Docker Image for MGKit

These are the files used to create the Docker image at [Docker Hub](https://hub.docker.com/r/frubino/mgkit/) for [MGKit](https://bitbucket.org/setsuna80/mgkit/src/develop/), installing the last development changes in the repository.

The image is based on ubuntu and includes Python 3, with the necessary packages and MGKit installed into a virtual environment in `/home/mgkit/mgkit-env`. A `mgkit` user is created and added to the *sudoers* (with no password). This is necessary to start the *mongodb* service when the container is started. This allows all the features to be tested in a reproducible manner, but may be problematic with other solutions, like [Singularity](http://singularity.lbl.gov/), as it wasn't tested.

The image also includes the following python packages, besides the required ones:

* cartopy
* descartes
* fiona
* geopandas
* shapely
* networkx

And to run the test suite:

* pytest
* pytest-datadir
* pytest-console-scripts

The [Jupyter Notebook](www.jupyter.org) is installed with the inclusion of the [Bash Kernel](https://github.com/takluyver/bash_kernel).

To download the images, use `docker pull frubino/mgkit:repo`

To run the container and access the command line:

`docker run -it frubino/mgkit:repo bash`

In the prompt then, the virtual environment and mongodb service must be started with:

```bash
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
sudo service mongodb start
source /home/mgkit/mgkit-env/bin/activate
```

All the scripts will be available, with the first 2 lines necessary for the [click](http://click.pocoo.org/5/python3/) package to work under Python 3.

To start the Jupyter Notebook, run:

`docker run -t -p 8888:8888 frubino/mgkit:repo`

And the Notebook will be available at `localhost:8888`. Keep note of the token display to access the Notebook in the browser. The `-v` option of `docker run` allows to link a host directory with a container directory:

`docker run -t -p 8888:8888 -v localdir:/home/mgkit/localdir frubino/mgkit:repo`
