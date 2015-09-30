#!/usr/bin/env bash

if [ "$OPERATOR_CONTACT_URL" = "http://change.me.com" ]
then
  echo "ERROR: Please be kind and set the OPERATOR_CONTACT_URL environment variable to reflect your local environment."
  exit 1
fi

sed -i -e "s|OPERATOR_CONTACT_URL|$OPERATOR_CONTACT_URL|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|CRAWL_DOMAINS|$CRAWL_DOMAINS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|ROBOTS_POLICY_NAME|$ROBOTS_POLICY_NAME|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|RESPECT_CRAWL_DELAY_UP_TO_SECONDS|$RESPECT_CRAWL_DELAY_UP_TO_SECONDS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|MAX_PER_HOST_BANDWIDTH|$MAX_PER_HOST_BANDWIDTH|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|MAX_TOE_THREADS|$MAX_TOE_THREADS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|PAUSE_AT_START|$PAUSE_AT_START|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|SNOOZE_LONG_MS|$SNOOZE_LONG_MS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|RETRY_DELAY_SECONDS|$RETRY_DELAY_SECONDS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|MAX_CRAWL_RETRIES|$MAX_CRAWL_RETRIES|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|DISPOSITION_DELAY_FACTOR|$DISPOSITION_DELAY_FACTOR|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|DISPOSITION_MIN_DELAY_MS|$DISPOSITION_MIN_DELAY_MS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|DISPOSITION_MAX_DELAY_MS|$DISPOSITION_MAX_DELAY_MS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|REGEX_IGNORE_VALUES|$REGEX_IGNORE_VALUES|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|DELAY_FACTOR|$DELAY_FACTOR|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|MAX_DELAY_MS|$MAX_DELAY_MS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
sed -i -e "s|MIN_DELAY_MS|$MIN_DELAY_MS|g" ${HERITRIX_DATA_DIR}/jobs/default/crawler-beans.cxml
