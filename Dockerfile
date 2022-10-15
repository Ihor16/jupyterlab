# Base image
ARG image

FROM "$image":latest

# Installing spellchecker extension
RUN conda install -c conda-forge -y \
    jupyterlab-spellchecker
