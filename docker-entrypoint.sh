#!/bin/sh

set -x

rm -rf ${FOLDER}
wait 5
git clone ${REPO}
wait 5
cd ${FOLDER} && hugo
