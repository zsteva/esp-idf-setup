#!/bin/bash
#
# MIT License
# 
# Copyright (c) 2025 Zeljko Stevanovic
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 

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


