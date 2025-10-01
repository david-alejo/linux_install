
xhost +local:docker
docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --name insertion \
    --net=host \
    --privileged \
    --mount type=bind,source=$HOME/insertion_shared,target=/home/insertion \
    insertion \
    bash
    
docker rm insertion
