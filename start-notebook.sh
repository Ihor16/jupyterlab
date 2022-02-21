#!/bin/bash

jupyter lab \
--notebook-dir=/opt/notebooks --ip='*' --port=8889 \
--no-browser --allow-root
