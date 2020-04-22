# docker-stacks-advanced

This is a Dockerfile that Jupyter Notebook automatically builds Docker images.

# Why build it?

This is a Dockerfile built on the [jupyter/all-spark-notebook](https://hub.docker.com/r/jupyter/all-spark-notebook) image. 

Because the `root` is not open in the official image of jupyter, a series of operations that need to be installed with root privileges in the jupyter notebook are restricted, such as `apt install`. 

Therefore, based on the official image of jupyter, I added additional root privileges, added support for zsh and oh-my-zsh, and commonly used plugins in jupyter notebook.

For more details,

Github: [link](https://github.com/SilvesterHsu/docker-stacks-advanced)

Docker: [link](https://hub.docker.com/r/silvesterhsu/stacks-advanced)

# How to run it?
Run *Jupyter Notebook* by default. 
```
docker run -it --name stacks --restart=always -p "$PORT":8888 -v "$PWD":/notebooks silvesterhsu/stacks-advanced:"$TAG"
```

`$PORT`: Port mapping. It is the port that needs to link the local to the image. In docker, jupyter will open port `8888` as a web access. If the local port `8888` is not occupied, it is recommended to use `8888`.

`$PWD`: File mapping. Project work path

`$TAG`: For the time being, only `latest`, if not filled in, the latest version is downloaded by default. The ARM version may be available in the future.

However,  *Jupyter Lab* support **debug** now !!!

Set the `$TAG` to `lab`

**Example:**

```
docker run -it --name stacks --restart=always -p 8888:8888 -v ~/new_project:/notebooks silvesterhsu/stacks-advanced:lab
```

## Set password

Once you start container, an unique`token` will be shown in the terminal.

![token](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9d2cyisj30nz07y451.jpg)

Use the `token` to setup a password when you open the browser `127.0.0.1:8888`.

**note:** The port number depends on the port you are mapping

![set password](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9ghwmaxj30gg06tdg8.jpg)

Once the password is set and successfully logged in, jupyterLab completes the password configuration. You need to terminate and restart the lab container in the terminal.

Use `control+C` to stop the jupyterlab container, or start a new terminal:

```
docker restart stacks
```

It is necessary to restart the container. After the password is stored, it needs to be restarted to apply.

Then, setting the password is complete.