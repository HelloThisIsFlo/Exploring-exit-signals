#!/bin/sh
echo "docker run --name=puzzle --rm puzzle $1"
docker run --name=puzzle --rm puzzle $1
