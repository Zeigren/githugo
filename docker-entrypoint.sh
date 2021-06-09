#!/bin/sh

set -ex

git ls-remote ${REPO}
rm -rf ${FOLDER}
git clone ${REPO}
cd ${FOLDER} && hugo
