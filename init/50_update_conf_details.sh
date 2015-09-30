#!/usr/bin/env bash

if [ "$OPERATOR_CONTACT_URL" = "http://change.me.com" ]
then
  echo "ERROR: Please be kind and set the OPERATOR_CONTACT_URL environment variable to reflect your local environment."
  exit 1
fi

sed -i -e "s|OPERATOR_CONTACT_URL|$OPERATOR_CONTACT_URL|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
