# Registries and Repos

Docker images are stored in registries.
You will want to store your images in a Docker registry. The registry can later
be referenced in your CI/CD pipline to facilitate agile practices.

A registry can be hosted several ways.

+ On [Dockerhub](http://hub.docker.com) (<https://index.docker.io/v1/>)
+ In a private registry
+ Locally

In this exercise we will be using a preconfigured private regisry hosted in Azure

## Working with Dockerhub

### **Login to Docker Hub (Skip if using private registry)**

Note, you must have a valid account on Docker hub in order to push images to a repository residing on this registry.  If you do not already have an account, go to <https://hub.docker.com/signup>.

``` docker
docker login -u<username> -p<password> [registry FQDN]
```

### **Tag an image in your local cache**

Before an image can be sent to a repository, it MUST be tagged appropriately.

Note, depending on the context of whether you are using a private registry or
the Dockerhub registry, the  `<imagename>` variable should be
interpreted as follows.

If using the DockerHub, `<imagename>` is:

```
<username>/<imagelabel>
```

If using a private registry:

```
<RegistryFQDN>/<imagelabel>
```

Tag the mycontainer image in order to prepare it to be sent to our repo

``` docker
docker image tag mycontainer:latest <imagename>:<tag>
```

Example

``` docker
docker image tag mycontainer:latest containerreg.azurecr.io/mycontainer:v1.0
```

### **Login to the private container registry**

```
 docker login -u <username>  -p <password> zoecontainerreg.azurecr.io
```

### **Send the tagged image to the Docker registry/repo**

```docker
docker push <imagename>:<tag>
```

### **Delete the image from the local cache**

Before an image can be deleted, containers referencing the image must be
stopped and deleted.

Stop the container

```docker
docker stop <container>
```

Remove the container

```docker
docker rm <container>
```

Remove the image from the local registry.  Be sure to delete all references.

```docker
docker image rm <imagename>:<tag>
```

### **Pull an image from the private registry/repo**

``` docker
docker pull <imagename>:<tag>
```

Note, you will also need to delete the original tagged image 'mycontainer'.
If you have any containers referencing this image, delete them as well.
using

```docker
docker rm <containerid|containername>
```
