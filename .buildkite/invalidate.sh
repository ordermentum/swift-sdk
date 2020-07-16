#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d%H%M%S")

aws configure set preview.cloudfront true
aws cloudfront create-invalidation \
  --distribution-id ${DISTRIBUTION_ID} \
  --invalidation-batch "{ \"Paths\": { \"Quantity\": 1, \"Items\": [ \"/ios/*\" ] }, \"CallerReference\": \"$TIMESTAMP\" }"

