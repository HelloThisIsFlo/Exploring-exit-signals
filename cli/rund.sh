#!/bin/sh
echo "docker run -d --name=puzzle --rm puzzle $1"
docker run -d --name=puzzle --rm puzzle $1
