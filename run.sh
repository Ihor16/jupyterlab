#!/bin/bash

printf "\n=== Starting Jupyter... \n"
docker compose up -d

name=$(docker container ls --format {{.Names}} | grep jlab)

# waits till the link is available
until [[ $(docker container logs $name 2>&1) == *"http:"* ]]; do
    sleep 1
done

printf "\n=== Use the link below to access it:\n"
docker container logs $name

printf "\n=== Done ===\n"
