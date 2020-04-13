#!/bin/sh

# input neede at the time of invoking
# GIT_REPO="https://github.com/samitkumarpatel/awx-demo.git"
# GIT_BRANCH_NAME="master"
# INVENTORY_HOST_FILE_PATH="inventories/xxx/host.yml"
# end of input neede at the time of invoking

set -f

WORKDIR=$(mktemp -d)
ACTUAL_INVENTORY_HOST_FILE_PATH="$WORKDIR"/"$INVENTORY_HOST_FILE_PATH"

# check if the temp directory was created 
if [[ ! "$WORKDIR" || ! -d "$WORKDIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# cleanup function
cleanup() {
  rm -rf "$WORKDIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# clone and generate the JSON structure from static inventories
git clone --single-branch --branch "$GIT_BRANCH_NAME" "$GIT_REPO" "$WORKDIR" 
ansible-inventory --list -i "$ACTUAL_INVENTORY_HOST_FILE_PATH"
