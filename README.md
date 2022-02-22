# Jupyter Lab Docker container image

Simple single-user container image that has:

- Jupyter Lab (including Jupyter Lab Git UI)
- Minconda Python distribution (including Conda)
- R and IRkernel
- Some common R packages (read the Dockerfile to see the list)

## Before you run

- **Generate an ssh-key** 
  
  It will allow you to push your changes to GitHub right from the Jupyter Lab
  
  ```
  ssh-keygen -t rsa -N '' -f ./ssh/id_rsa
  ```
  
  ```
  cat ./ssh/id_rsa.pub
  ```
  
  The `./ssh/` directory is going to be mounted to the container, so you can put this public key to your GitHub list of SSH keys. If the container restarts, the same key is going to be mounted there, so you don't need to update your GitHub SSH list. 

- **Change default password**
  You can change your Jupyter Lab password by editing a line in the `./config/jupyter_server_config.py` file that says 
  
  ```
  password = passwd("jlab")
  ```
  
  Change `jlab` to your preferred password and you'll be prompted to enter it when you try to access the Jupyter Lab.
  
  If you want to change the password after starting the Jupyter Lab, just edit this file and shutdown the Jupyter Lab from the GUI. It will automatically restart the container and apply the updated password.

## How to run:

#### Locally:

```
docker compose up -d
```

#### On Docker Swarm

```
docker stack deploy -c docker-compose.yml jlab
```

It might take some time to start because it may need to pull an image that you don't have. Run

```
watch docker service ls
```

to check when it's ready.

---

The exposed port is `8889`. When the container is running, you need to access this port in the browser and enter the Jupyter Lab password. The default one is `jlab` (read above on how to change it).

The contents of the `./files/` are mounted to the container's working directory, so the data you have in the `./files/` is accessible in the Jupyter Lab. If the container crashes, all your data is persisted to the `./files/` directory, so when you restart the container, you can continue working with the same files.

## Troubleshooting

- Try opening your GitHub project in the Jupyter Lab GUI and pulling changes. If it doesn't work, open a terminal from the GUI (File → New → Terminal), cd into your project's directory, and run
  
  ```
  git pull
  ```
  
  to authenticate the host.
  
  If it still doesn't work, make sure you added the SSH key to your GitHub list.

## Attribution

This image is based on the [ubcdsci/jupyterlab](https://hub.docker.com/r/ubcdsci/jupyterlab) image ([Dockerfile](https://github.com/UBC-DSCI/jupyterlab/blob/main/Dockerfile)).
