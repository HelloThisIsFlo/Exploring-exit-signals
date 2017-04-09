#!/bin/bash

rm result.html
cp ./table.yml ./docker/

docker build -t yml ./docker/
docker run yml ruby tool.rb ./table.yml > result.html 

climate http-server 1234
