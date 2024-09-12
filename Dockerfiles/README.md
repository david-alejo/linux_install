* Docker files for ROS noetic and ROS 2 Humble

** Build the docker:

To build a docker just use docker build. For example in noetic folder:

```

> docker build . -t marsupial
```


** Usage 

This docker is intended to be used with the Rocker application from osrf-robotics.

The idea is to share the user, home directory and interfaces and devices from the OS.

To run the docker, please install the rocker application (please refer to https://github.com/osrf/rocker).

Then, you can use the following command from a terminal, to create a instance of the docker:

```

> rocker --network host --x11 --user --home --devices /dev/tty* /dev/input/j* --mode interactive marsupial
```

To add more terminals, you have to connect to the current instance. You can do it with this command:

```
> docker exec -it \"$(docker ps | cut -d' ' -f1 | tail -1)\" /bin/bash
```

This command connects to the last executed docker and then executes a terminal in it.

