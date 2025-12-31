#!/bin/bash

if [ "x$1" = "x-l" -o "x$1" = "x--login" ]; then
	export BASH_ENV="$(dirname "$0")/idf-env-extra.sh"
	exec bash -l
fi

if [ "x$1" = "x-c" ]; then
	. "$(dirname "$0")/idf-env-extra.sh"
	exec bash "$@"
fi

export BASH_ENV="$(dirname "$0")/idf-env-extra.sh"
exec bash "$@"

