#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/flclash"
_RUNNAME="${_APPDIR}/FlClash"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { 
    echo "Failed to change directory to ${_APPDIR}" >&2
    exit 1
}
exec "${_RUNNAME}" "$@" || exit $?
