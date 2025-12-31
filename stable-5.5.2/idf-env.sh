
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

