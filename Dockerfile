FROM continuumio/miniconda3

# Install Jupyter, JupterLab, R & the IRkernel
RUN conda install --yes --quiet --channel conda-forge \
    jupyter \
    jupyterlab \
    r-base=4.1.1 \
    r-irkernel

# Install JupyterLab Git Extension
RUN pip install jupyterlab-git

# Create working directory for mounting volumes
RUN mkdir -p /opt/notebooks

# Make port 8889 available for JupyterLab
EXPOSE 8889

# Install Git, vim, the nano-tiny text editor and less (needed for R help)
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    git \
    vim \
    nano-tiny \
    less \
    && rm -rf /var/lib/apt/lists/*

# Install necessary R packages
RUN conda install -c conda-forge -y \
    r-devtools \
    r-tidyverse \
    r-cowplot \
    r-ggally \
    r-gridextra \
    r-infer \
    r-testthat \
    r-themis \
    r-kknn \
    r-haven

# GitHub packages installation is taken from:
# https://github.com/UBC-STAT/stat-201/blob/master/dockerfiles/r-stat-201/Dockerfile
RUN Rscript -e "devtools::install_github('UBC-MDS/datateachr@v0.2.1')" \
    && Rscript -e "devtools::install_github('UBC-MDS/taxyvr@0.1.0')"

# Installing spellcheck extension
# https://github.com/jupyterlab-contrib/spellchecker
RUN conda install -c conda-forge -y \
    nodejs \
    jupyterlab-spellchecker

# Copy JupyterLab start-up script into container
COPY start-notebook.sh /usr/local/bin/

# Change permission of startup script and execute it
RUN chmod +x /usr/local/bin/start-notebook.sh
CMD ["/usr/local/bin/start-notebook.sh"]

# Switch to starting in directory where volumes will be mounted
WORKDIR "/opt/notebooks"
