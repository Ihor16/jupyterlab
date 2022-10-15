#!/bin/bash

# Description: starts JupyterLab container
# Usage: ./run.sh

printf "\n=== Starting Jupyter... \n"
docker compose up -d

name=$(docker container ls --format {{.Names}} | grep jlab)

# waits till the link is available
until [[ $(docker container logs $name 2>&1) == *"http:"* ]]; do
    sleep 1
done

printf "\n=== Use the link below to access it:\n"

link=$(docker container logs $name 2>&1 |
        grep "http://127.0.0.1" |
        grep "token" | 
        tail -n 1 | 
        awk '{print $2}')
echo $link
echo "chrome $link" | clip.exe

printf "\n=== Done ===\n"
