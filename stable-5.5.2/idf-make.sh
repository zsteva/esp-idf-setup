#!/bin/bash

. "$(dirname "$0")/idf-env-extra.sh"

exec make "$@"

