# Deploy my first Docker container

## Hello World

Windows

``` docker
sudo docker run --name helloworld hello-world:nanoserver-1809
```

Linux

``` docker
sudo docker run --name helloworld hello-world:linux
```

## Deploy an Alpine container

``` docker
sudo docker run --name alpine1 -itd alpine
```
