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
3. Run `update.sh` to pull a newer UBC JupyterLab Docker image specified in the `.env` file. This image will be used for subsequent container startups. Only the latest uncommented `image` will be used

### Troubleshooting

1. If you're working with private repositories, you can mount your ssh-key into the container's `$HOME` directory by adding this line to the `docker-compose.yaml` under `volumes`:
   
   ```yaml
    - ~/.ssh/:/home/jovyan/.ssh/:ro
   ```
   
   Make sure that the `$HOME` directory of the container matches the one you specify in the `docker-compose.yaml`. In this case, it is `/home/jovyan/`, but it may change in newer versions of the JupyterLab image. To check the `$HOME` directory of the container, type
   
   ```shell
   # Get names of running containers
   docker container ls --format {{.Names}}
   
   # Get $HOME value of the container,
   # change <container-name> to your container
   docker container exec <container-name> bash -c 'echo $HOME'
   ```
2. If there are no files in JupyterLab after you add them to the `materials/` directory, check the path to the container's `$HOME` directory in the `docker-compose.yaml` file under `volumes` using the steps above.

### Attributions

The JupyterLab images are based on UBC images from:

* [ubcdsci](https://hub.docker.com/u/ubcdsci)
* [ubcstat](https://hub.docker.com/u/ubcstat)
