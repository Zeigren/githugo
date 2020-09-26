#!/bin/sh

set -x

rm -rf ${FOLDER}
git clone ${REPO}

cd ${FOLDER} && hugo

exec "$@"
