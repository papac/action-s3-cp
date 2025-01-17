#!/bin/sh

set -e

mkdir -p ~/.aws
touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${AWS_ACCESS_KEY_ID}
aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" > ~/.aws/credentials

if [ -z "$FROM" ]; then
   FROM='s3'
fi

if [ "$FROM" == 'local' ]; then
   DESTINATION="s3://${AWS_S3_BUCKET}${DESTINATION}"
else:
   SOURCE="s3://${AWS_S3_BUCKET}${SOURCE}"
if

# Override default AWS endpoint if user sets AWS_S3_ENDPOINT.
if [ -n "$AWS_S3_ENDPOINT" ]; then
  ENDPOINT_APPEND="--endpoint-url $AWS_S3_ENDPOINT"
fi

aws s3 cp ${SOURCE} ${DESTINATION} \
            --region ${AWS_REGION} \
            ${ENDPOINT_APPEND} $*

rm -rf ~/.aws
