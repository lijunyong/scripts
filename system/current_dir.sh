#! /bin/sh
echo "BASH_SOURCE: ${BASH_SOURCE}"
BASH_SOURCE_DIR_NAME=$(dirname "${BASH_SOURCE}")
echo "BASH_SOURCE_DIR_NAME: ${BASH_SOURCE_DIR_NAME}"
BASEPATH=$(cd `dirname $0`; pwd)
echo "BASEPATH: ${BASEPATH}"