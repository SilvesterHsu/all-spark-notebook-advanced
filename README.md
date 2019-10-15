# docker-stacks-advanced

This is a Dockerfile that JupyterLab automatically builds Docker images.

For more details,

Github: [link](https://github.com/SilvesterHsu/docker-stacks-advanced)

Docker: [link](https://cloud.docker.com/repository/docker/silvesterhsu/https://cloud.docker.com/repository/registry-1.docker.io/silvesterhsu/stacks-advanced)

# How to run it?

```
docker run -it --name stacks -p "$PORT":8888 -v "$PWD":/notebooks silvesterhsu/stacks-advanced:"$TAG"
```

## Set password

Once you start container, an unique`token` will be shown in the terminal.

![token](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9d2cyisj30nz07y451.jpg)

Use the `token` to setup a password when you open the browser `127.0.0.1:8888`.

![set password](https://tva1.sinaimg.cn/large/006y8mN6gy1g7i9ghwmaxj30gg06tdg8.jpg)

Once the password is set and successfully logged in, jupyterLab completes the password configuration. You need to terminate and restart the lab container in the terminal.

Use `control+C` to stop the jupyterlab container, or start a new terminal:

```
docker restart stacks
```

Then, setting the password is complete.
