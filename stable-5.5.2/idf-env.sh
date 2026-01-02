
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

##echo "idf-env.sh"

if [ -z "${OLD_PATH}" ]; then
        OLD_PATH="${PATH}"
fi

if [ -z "${OLD_PS1}" ]; then
        OLD_PS1="${PS1}"
fi

export PS1="(esp-idf-5.5.2 \${ESPPORT:-}) ${OLD_PS1}"

#export IDF_TOOLS_PATH=${HOME}/esp
export IDF_TOOLS_PATH="/opt/espressif32-5.5.2"
export IDF_PATH=${IDF_TOOLS_PATH}/esp-idf

source ${IDF_PATH}/export.sh

