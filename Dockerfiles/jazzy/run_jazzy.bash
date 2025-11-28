
xhost +local:docker
docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --name jazzy \
    --net=host \
    --privileged \
    --mount type=bind,source=$HOME/jazzy_shared,target=/home/insertion \
    jazzy \
    bash
    
docker rm jazzy
