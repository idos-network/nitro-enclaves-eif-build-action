#!/bin/bash
set -e

if [ -d "/custom-kernel-blobs" ] && [ "$(ls -A /custom-kernel-blobs)" ]; then
  echo "Custom kernel blobs found. Copying to /usr/share/nitro_enclaves/blobs..."
  rm -rf /usr/share/nitro_enclaves/blobs/
  cp -a /custom-kernel-blobs/ /usr/share/nitro_enclaves/blobs
  ls -lh /usr/share/nitro_enclaves/blobs
else
  echo "No custom kernel blobs provided."
fi

nitro-cli build-enclave --docker-uri ${DOCKER_IMAGE_TAG}:latest --output-file /output/enclave.eif
nitro-cli describe-eif --eif-path /output/enclave.eif > /output/eif-info.txt
