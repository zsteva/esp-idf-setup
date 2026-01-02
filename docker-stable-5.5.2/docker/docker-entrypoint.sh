#!/bin/bash

if [ -e "${IDF_TOOLS_PATH}/bash-env.sh" ]; then
    . "${IDF_TOOLS_PATH}/bash-env.sh"
else
    echo "... missing esp-idf enviroments ..."
fi

exec "$@"
