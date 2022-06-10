# Docker Image for MGKit

This is a new Dockerfile that allows the use of MGKit using a container. You can run the scripts directly, for example:

`docker run --rm -i frubino/mgkit:latest sampling-utils rand_seq`

Will run the `sampling-utils rand_seq` to create some randome FASTA sequences. Commands can be piped as well:

`docker run --rm -i frubino/mgkit:latest sampling-utils rand_seq | docker run --rm -i frubino/mgkit:latest fasta-utils translate`

Will translate the random sequneces from the first command. Highly suggested to use an alias, such as:

`alias mgkit='docker run --rm -i frubino/mgkit:latest'`

This way the above command becomes:

`mgkit sampling-utils rand_seq | mgkit fasta-utils translate`

If you want to run interactively a series of commands you can use `bash` instead of another command, but remember to add the `-t` option:

`docker run --rm -it frubino/mgkit:latest bash`

# Build branch

A `frubino/mgkit:build` branch is present to allow the creation of Conda packages. Checkout the branch with `git checkout build`. A script is included to build the image and environment are used to specify output directory inside the container, the Python version to use to build and the MGKit version to use

# Singularity

> You need to modify the version of MGKit manually with a tag or commit id (after the `@` in the `pip` line)

There are 2 options to use this image with *Singularity*, 1) create a Docker image using the `Dockerfile.singularity` and then pull it or 2) building it with *Singularity*, for example with <https://cloud.sylabs.io/> (command `singularity build --remote`) if `root` access is not available.

## Docker Image

The main difference between the 2 `Dockerfile` is that the Singularity version removes any use of a specific user, because that is mostly done to mount a directory in the image. Also instead of using a version of MGKit in `conda` PyPI is used instead.

## Test

Try to run: `singularity exec mgkit_0.6.0.sif sampling-utils rand_seq | singularity exec mgkit_0.6.0.sif fasta-utils info`

> Correct for the image name used in the build process