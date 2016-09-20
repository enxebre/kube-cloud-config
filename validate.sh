#!/bin/bash

ls
OUTPUT="$(curl 'https://validate.core-os.net/validate' -k -X PUT --data-binary '@master-cloud-config.yaml')"
echo "${OUTPUT}" | grep -q error
if [ $? = 0 ]; then
  echo $OUTPUT
  exit 1;
fi
echo "SUCCESS"
echo $OUTPUT
