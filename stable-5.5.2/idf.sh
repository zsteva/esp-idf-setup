#!/bin/bash

if [ -z "$IDF_TOOLS_PATH" ]; then
    . "$(dirname "$0")/idf-env-extra.sh"
fi

exec idf.py "$@"

