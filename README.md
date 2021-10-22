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