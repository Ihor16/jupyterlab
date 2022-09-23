#!/bin/bash

printf "\n=== Removing Jupyter container...\n"
docker compose down

printf "\n=== Done ===\n"

read -r
