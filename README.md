# Docker
This is an exhaustive list of commands used for docker 

#### To check number of running container | both running and not running
```
docker ps | docker ps -a
```


#### To check number of images on the host 
```
docker images
```

#### Run a container using the image   |    Run a container and specify the name   |   Run a container with tag and ports
```
docker run <image> | docker run -d --name <name> <image> | docker run -p <host-port>:<container-port> <image>:<tag> <network-name> <image>
```

#### with environment variable        |   with network (default=bridge other options-none,host)
```
docker run -e <env-var> <image> | docker run -d -e MYSQL_ROOT_PASSWORD=<password> --name <name> --network 
```
#### Example 
```
docker run --network=wp-mysql-network -e DB_Host=mysql-db -e DB_Password=db_pass123 -p 38080:8080 --name webapp --link mysql-db:mysql-db -d kodekloud/simple-webapp-mysql
```
#### To open multiple terminals of same docker container
```
docker exec -it <container_id_or_name> bash
```

#### To run container in the background
```
docker run -d <image>
```

#### Stop a container                      |   stop all containers
```
Ctrl+C / docker stop <container-id> | docker stop $(docker ps -aq)
```

#### Delete a container        |   Delete all containers
```
docker rm <container-id> | docker rm $(docker ps -aq)
```

#### Delete an image       |   Delete all images {STOP AND DELETE CONTAINERS BEFORE DELETING IMAGES}
```
docker rmi <image> | docker rmi $(docker images -aq) # Stop and delete containers before deleting images
```

#### Pull an iamge
```
docker pull <image>
```

#### Ports
```
{}:{Port-published-on-the-Host}->{Port-exposed-on-container}/tcp | 0.0.0.0:3456->3456/tcp
```

#### To find base image used in Dockerfile
```
grep -i FROM /<Path>/Dockerfile
```

#### To find any parameter in Dockerfile without opening
```
cat Dockerfile-<image> | grep <parameter>'| cat Dockerfile-mysql | grep ENTRYPOINT | cat Dockerfile-wordpress | grep CMD
```

#### To build image from Dockerfile
```
cd <desired_directory_with_Dockerfile>
docker build -t <image-name>:<tag> .      # "."(dot) indicates for the current directory
```

#### To find base OS of the image
```
docker run <image> cat /etc/*release*
```

#### To inspect a container            | To check environment variable
```
docker inspect <container-name> | docker inspect <container-name> | grep -A 10 Env
```

#### To know the env field from within a container
```
docker exec -it <container-name> env
```

#### To check number of networks on the system |   To inspect bridge
```
docker network ls |   docker network inspect bridge

docker inspect alpine-1
```

#### To create a new network
```
docker network create --driver bridge --subnet <subnet> --gateway <gateway> <network-name>
```

#### To mount a volume to a container (default /var/lib/docker)
```
docker run -v <data-path>:/var/lib/<data> <image>       |       
docker run \
--mount type=bind,source=<data-path>,target=/var/lib/<data> <image>
```

#### Compose a docker (go to the path)
```
docker-compose up
```
# Rocker

Rocker is a A tool to run docker images with customized local support injected for things like nvidia support and 
user id specific files for cleaner mounting file permissions.

To install [Rocker](https://github.com/osrf/rocker)

#### Integrated Extensions
There are a number of integrated extensions. Here are some of the highlights. You can get full details on the extensions from the main rocker --help command.

    x11 -- Enable the use of X11 inside the container via the host X instance.
    nvidia -- Enable NVIDIA graphics cards for rendering
    cuda -- Enable NVIDIA CUDA in the container
    user -- Create a user inside the container with the same settings as the host and run commands inside the container as that user.
    home -- Mount the user's home directory into the container
    pulse -- Mount pulse audio into the container
    ssh -- Pass through ssh access to the container.
    privileged -- Grants a Docker container root capabilities to all devices on the host system


#### To run Gazebo on Melodic
```
rocker --nvidia --x11 osrf/ros:melodic-desktop-full gazebo
```

#### To mount volumes 
```
--volume /file_path_on_host_pc:/file_path_on_docker. The changes made in the docker will be reflected.
```
#### Example: 
```
rocker --nvidia --x11 osrf/ros:humble-desktop-full --volume /home/ros_ws/my_robot_description:/home/ros_ws/my_robot_description
```
```
rocker --privileged --x11 --volume ~/Downloads/docker_ros_noetic:/urdf_output --  ros:noetic
```
