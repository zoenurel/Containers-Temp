# **Connecting containers**

Now that we understand a little more about containers, lets take it a step furhter.
In this excercize, we will walk through a typical workflow of searching for and
finally deploying a container running Microsoft SQL database.


## **Using Docker Hub**

There are litterally thousands of publically available images available on Docker hub.
Don't re-invent the wheel.  If someone has already done the heavy lifting then go for
it! Use the public repos.

### **Find a MSSQL Server Image**

 Find the MSSQL image

+ Go to [DockerHub](http://hub.docker.com) and search for 'MSSQL'. Choose
 the mssql-server-linux image.

+ Review important information. This includes:
  + Featured Tag information
  + Full Tag info
  + How to use this image
  + Environment Variables

+ Paste the appropriate pull command to the Docker hosts. I.e.

``` docker
docker run --name mssql -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=myStrong!Password' -p 1433:1433 -d mcr.microsoft.com/mssql/server:latest-ubuntu
```

Note, this image requires the Docker host have at least 2GB of RAM!

Now that our SQL container (mssql) is up and running, lets verify it working properly by connecting to it with the SQLCMD utility.  We can even run the client in a container!

+ Run a SQLCMD container

``` docker
docker run --name sqlcmd -itd mcr.microsoft.com/mssql-tools
```

+ Lets view a list of running containers

```docker
docker ps
```

+ Get IP address of MSSQL container

    The MSSQL container is running on its own internal network that is isolated from
    the host networking stack. We will need to determine IP address of the container
    so we can target our tools.  

To find the IP address of the container we will use the 'inspect' command.

```docker
docker inspect mssql
```

Do you see the address of the container?

+ Attach to the sqlcmd container
Even though the sqlcmd container is up and running, we are not currently
attached to it.  Lets get connected.

```docker
docker attach sqlcmd
```

+ Verify SQL is up and running
  + Connect to the mssql container from the sqlcmd container

  ``` sql
  sqlcmd -S <mssqlIPAddress> -U sa -P 'myStrong!Password'
  ```

+ Verify you can execute SQL query

    ```sql
    USE Master
    GO

    SELECT * FROM information_schema.tables;
    GO
    ```

+ Exit the SQLCMD container
  + [CNTRL+P+Q]

## **Takeaways**

+ There are plenty of images are available from Docker hub to get you started
+ Connecting multiple containers on the same or different hosts is straight forward provided you understand how your container is exposed on the network.
