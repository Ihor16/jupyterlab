# JupyterLab Docker Container
This repository contains scrips for starting JupyterLab in Docker.
The scripts are optimized for UBC DSCI and STAT working environments.

### Startup
1. Run `run.sh` to start JupyterLab. Then use the printed link to access Jupyter from the browser
2. Put some files to the `materials/` directory. They'll become available in Jupyter, so you can work on them there

### Shutdown
1. Run `uninstall.sh` to stop the local JupyterLab

After you close Jupyter, the files you put in the `materials/` directory are saved there.

### Additional features
The JupyterLab image is based on the official UBC Docker images, but has some additions.
1. Jupyter [spellcheck extension](https://github.com/jupyterlab-contrib/spellchecker)
2. The scripts work for any UBC DSCI and STAT courses that use Jupyter. Just change/uncomment the `image` variable in the `.env` file and start the container

### Attributions
The JupyterLab images are based on UBC images from:
* [ubcdsci](https://hub.docker.com/u/ubcdsci)
* [ubcstat](https://hub.docker.com/u/ubcstat)
