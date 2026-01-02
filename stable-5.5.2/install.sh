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

