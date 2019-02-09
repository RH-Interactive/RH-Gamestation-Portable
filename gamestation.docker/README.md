# Install docker
  **Ubuntu:** https://docs.docker.com/install/linux/docker-ce/ubuntu/

  **Fedora:** https://docs.docker.com/install/linux/docker-ce/fedora/

  **Windows:** https://docs.docker.com/docker-for-windows/install/

# Create the gamestation docker image on your computer
```
sudo docker build -t gamestation-docker .
```
# Start the container and compile
```
cd [Where you want] # which contains the gamestation.linux directory
sudo docker run -it --rm -v $PWD/gamestation.linux:/build gamestation-docker
cat /etc/lsb-release # Ubuntu 18.04
make gamestation-rpi3_defconfig
make
ls output/images/gamestation
exit # exit from the docker, your files are still here in $PWD/gamestation.linux
```
to return in the docker and continue to work
```
sudo docker run -it --rm -v $PWD/gamestation.linux:/build gamestation-docker
```
# Tips
###### List docker images
```
sudo docker image ls
```
###### Remove docker images
```
sudo docker rmi [image]
```
###### List docker containers
```
sudo docker ps
```
###### Remove docker containers
```
sudo docker kill [container name]
```
###### Build the image from a docker file
```
cd gamestation.docker
sudo docker build . -t gamestation-docker
```

*Credits: http://gamestation-linux.xorhub.com/wiki/doku.php?id=en:compile_gamestation.linux_via_docker*
