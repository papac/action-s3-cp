FROM python:3.7-alpine

LABEL "com.github.actions.name"="S3 cp file"
LABEL "com.github.actions.description"="Copy a file to an AWS S3 bucket"
LABEL "com.github.actions.icon"="copy"
LABEL "com.github.actions.color"="green"

LABEL version="1.0.0"
LABEL repository="https://github.com/qoqa/action-s3-cp/"
LABEL homepage="https://github.com/qoqa/action-s3-cp/"
LABEL maintainer="QoQa <dev@qoqa.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.16.232'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
