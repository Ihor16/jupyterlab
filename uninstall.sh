#!/bin/bash

# Description: stops JupyterLab container
# Usage: ./uninstall.sh

printf "\n=== Removing Jupyter container...\n"
docker compose down

printf "\n=== Done ===\n"
