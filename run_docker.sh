#!/bin/bash

DOCKER_VOLUMES="
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
--volume="${XAUTHORITY:-$HOME/.Xauthority}:/root/.Xauthority" \
--volume="${PWD}":"/home/aerial_robotics":rw \
"
DOCKER_ENV_VARS="
--env="DISPLAY" \
--env="QT_X11_NO_MITSHM=1" \
--env="NVIDIA_DRIVER_CAPABILITIES=all" \
"

DOCKER_DEVICE_VAR="
--device=/dev/bus/usb  \
"

DOCKER_ARGS=${DOCKER_VOLUMES}" "${DOCKER_ENV_VARS}" "${DOCKER_DEVICE_VAR}

# Run the command
docker run -it --net=host --ipc=host --gpus all --privileged ${DOCKER_ARGS} ros_aerial_robotics bash
# docker run -it --net=host --ipc=host --gpus all --privileged ${DOCKER_ARGS} ros_aerial_robotics bash -c "$1"
