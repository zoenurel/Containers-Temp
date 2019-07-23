# Deploy a local registry server

## References

<https://docs.docker.com/registry/deploying/>

## Run a local registry server container

```docker
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```

## Tag a local image

```docker
docker tag <imagename>:<tag> localhost:5000/<name>:<tag>
```

## Push an image to the local repo

``` docker
docker push localhost:5000/<name>:tag
```
