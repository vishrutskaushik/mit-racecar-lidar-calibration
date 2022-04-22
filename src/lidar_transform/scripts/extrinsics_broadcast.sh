#!/bin/bash

CALIBRATION_DIR=$2
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/.."

EXTRINSICS_FILES=(
  "${CALIBRATION_DIR}/vlp16_extrinsic.yaml"
)

function help() {
  echo 'Options:
    publish: broadcast the extrinsic
    clean: extrinsics clean
  '
}

function clean() {
  ps -ef | grep static_transform_publisher | awk '{print $2}' | xargs kill -2
}

function publish() {
  for i in "${EXTRINSICS_FILES[@]}"
  do
    python ${DIR}/extrinsics_broadcaster.py $i &
  done
}

case $1 in
  publish)
    # Clean the previous Transforms
    clean $@

    #Publish new transforms
    publish $@
    ;;
  clean)
    clean $@
    ;;
  *)
    # Clean the previous Transforms
    clean $@

    #Publish new transforms
    publish $@
    ;;
esac
