#!/bin/sh
set -f

WORKDIR=$(mktemp -d)

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
git clone https://github.com/samitkumarpatel/awx-demo.git "$WORKDIR"
ansible-inventory --list -i "$WORKDIR"/inventories/dev/host.yml 
