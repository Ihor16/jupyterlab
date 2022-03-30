#!/bin/bash

jupyter lab \
--notebook-dir=/home/jlab/notebooks --ip='*' --port=8889 \
--no-browser --allow-root
