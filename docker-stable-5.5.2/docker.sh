#!/bin/bash

DOCKER_IMAGE_NAME="zsteva/esp-idf:5.5.2"
PORT="${PORT:-/dev/ttyACM0}"

if [ -z "$1" ]; then
    echo "usage:"
    echo "        $0 docker-build"
    echo "        $0 shell -- open bash in docker"
    echo ""
    echo "        $0 build"
    echo "        $0 flash"
    echo "        $0 monitor"
    echo ""
    echo "        $0 <idf.py options...>"
    echo ""
    exit 99
fi

declare -a RUN

if [ "$1" = "shell" ]; then
    RUN=("/bin/bash")
elif [ "$1" = "docker-build" ]; then
    shift
    docker build \
        -t "$DOCKER_IMAGE_NAME" \
        "$(dirname "$0")/docker" "$@"

    exit $?
else
    RUN=("idf.py" "$@")
fi

declare -a DOCKER_ARGS
DOCKER_ARGS=( \
    "-v" "$(dirname "$0"):/home/user/project" \
    -w "/home/user/project" \
)

if [ -e "$PORT" ]; then
    DOCKER_ARGS+=("--device" "$PORT")
fi

docker run -ti --rm \
    "${DOCKER_ARGS[@]}" \
	"$DOCKER_IMAGE_NAME" \
    "${RUN[@]}"


