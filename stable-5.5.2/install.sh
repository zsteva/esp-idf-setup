#!/bin/bash

set -e -x

VERSION=5.5.2

#export IDF_TOOLS_PATH=${HOME}/esp
export IDF_TOOLS_PATH="/opt/espressif32-${VERSION}"

test -e "${IDF_TOOLS_PATH}" \
	|| mkdir -p ${IDF_TOOLS_PATH}

cd ${IDF_TOOLS_PATH}

test -e "esp-idf" \
	|| git clone -b "v${VERSION}" --recursive https://github.com/espressif/esp-idf.git

export IDF_PATH=${IDF_TOOLS_PATH}/esp-idf

cd ${IDF_PATH}

if python --version 2>&1 | grep 'Python 3.' > /dev/null 2>&1; then
	XPYTHON=python
else
	XPYTHON=python3
fi

./install.sh all


#$XPYTHON tools/idf_tools.py install

#$XPYTHON tools/idf_tools.py install-python-env

