# Container management

## Management tasks

### View a list of running containers

``` docker
sudo docker ps
```

Notice that only one container is running.  Why is that?

### View all containers

``` docker
sudo docker ps -a
```

### Attach to a running container

The Alpine container is up and running a ash shell process. Lets attach to the container.

``` docker
sudo docker attach <containerId>
```

You are now connected to the Alpine container.  Lets have a look around:

``` docker
ping 4.2.2.2
```

``` shell
ping google.com
```

```
ls -a
```

You can ping by name too. The container uses pre defined DNS settings so name resolution works tranparently.
You can verify this by examining the /etc/resolv.conf file of the container.

Type the following and hit enter.
```
cat /etc/resolv.conf
```

Now exit the container by pressing [CNTRL+P+Q]

### Inspect a container

In many cases, you may want to get further details about a container.  Lets inspect the Alpine container. 

```
sudo docker inspect alpine1
```

Interesting info to observe:

+ State
+ Hostname
  + When a container starts, it is assinged a hostname. This name is
  addressable from other containers and is resolved via name resolution.
+ NetworkSettings/Networks
  + In this case, the container is connected to the built in bridge network.
   This is by default.  The container is also assigned an IP address.
   IP address allocation is completely automatic as it is handled by the Docker
   engine.  More on networks to come.

It is important to understand that the container is isolated from the host
networking stack and is not reachable from other Docker hosts (using bridge).
There are ways to resolve this.  

### Stopping a container

Lets stop the Alpine1 container

``` docker
sudo docker stop alpine1
```

Alpine1 no longer shows up in the list of running containers

``` docker
sudo docker ps
```

-or

``` docker
sudo docker container ls
```

### Starting a container

``` docker
sudo docker start alpine1
```

A container starts really quickly compared to starting a full VM with an
operating system.

### Remove a container

``` docker
sudo docker rm <ContainerID|ContainerName>
```
