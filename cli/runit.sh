#!/bin/sh
echo "docker run -it --name=puzzle --rm puzzle $1"
docker run -it --name=puzzle --rm puzzle $1
