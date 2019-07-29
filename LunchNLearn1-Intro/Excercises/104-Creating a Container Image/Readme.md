# Creating a container using a Dockerfile

## References
<https://docs.docker.com/get-started/part2/>

## The Dockerfile is used to create a Docker Image

For this excercize, copy and paste the content provided into
the appropriate files. I.e. the contents of the Dockerfile
should be pasted into the Dockerfile created during the excercize.

+ Create a new directory called 'myContainer'

```
mkdir myContainer
```

+ Navigate into the folder

``` Shell
cd myContainer
```

+ Create the Dockerfile

    ```bash
    nano Dockerfile
    ```
  
+ Create the Python application (app.py)

    ```bash
    nano app.py
    ```

+ Create the 'requirements.txt' file

    ```bash
    nano requirements.txt
    ```
  
+ Build the container

    ```docker
    docker build .
    ```

+ Get the ID of the image

    ```docker
    docker image ls
    ```

+ Tag the image. Tagging an image associates repo and tag properties

    ```docker
    docker tag <imageID> mycontainer:latest
    ```

    For a remote repo, the syntax is slightly different

    ```docker
    docker tag <imageID> zoecontainerreg.azurecr.io/mycontainer
    ```

+ Create a container from the new image

    ```docker
    docker run -it --name mycontainer mycontainer
    ```

+ Connect to the flask application running inside the new container

    From you browser, connect to the application:

    ```http
    http://<DockerHostIPAddress>
    ```

    To get the address of the Docker host, exit the container ([CNTRL+P+Q]) and
    issue the following command. The IP address of your VM is on the eth0
    interface.

    ```docker
    ip addr sho
    ```

    Why didn't it work?

    In order for you to gain access to the container from the host networkwing
    stack or outside the container, a port will need to be exposed on the
    host networking stack.

    Run:

    ``` docker
    docker ps
    ```

    Notice the container is running on TCP port 80. However, this port is only
    accessible internally and not opened up on the host networking stack.

    Ok, lets exit and stop and delete the container

    ```docker
    [CNTRL+P+Q]

    docker stop <containerID>|<containerName>

    docker rm <containerID>
    ```

    Lets try this again:

    This time we will bind the docker host port 8000 to the internal port 80.

    ```docker
    docker run -it --name mycontainer -p 8000:80 mycontainer
    ```

    Lets have another look at the running docker containers:

    ``` docker
    docker ps
    ```

    Notice the port mappings have changed. The host networking stack is now
    listening on port 8000 and will NAT traffic to port 80 in the application.

    Try connecting again via your browser

    ```http
    http://<DockerHostIPAddress>:8000
    ```

+ Stop the container

    ```docker
    docker stop mycontainer
    ```