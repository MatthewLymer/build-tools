# build-tools

## Build image

    docker build . -t matthewlymer/build-tools:latest
	
## Run image

    docker run --rm -it -v ${pwd}:/workdir matthewlymer/build-tools:latest /bin/bash
	
