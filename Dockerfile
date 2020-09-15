FROM alpine
LABEL maintainer "CONTINIX DevOps <devops@continix.com>"

# Env setup
ENV TERRAFORM_VERSION=0.13.2 \
    PACKER_VERSION=1.6.2 \
    OSNAME=linux \
    OSARCH=amd64 \
    DEST=/usr/local/bin

ENV TERRAFORM_ZIPFILE=terraform_${TERRAFORM_VERSION}_${OSNAME}_${OSARCH}.zip \
    PACKER_ZIPFILE=packer_${PACKER_VERSION}_${OSNAME}_${OSARCH}.zip

RUN apk --update --no-cache add libc6-compat git openssh-client py-pip python3 curl ansible && pip install awscli

# Installing terraform and packer in path
RUN cd ${DEST} && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIPFILE} -o ${TERRAFORM_ZIPFILE} && \
    curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/${PACKER_ZIPFILE} -o ${PACKER_ZIPFILE} && \
    unzip ${TERRAFORM_ZIPFILE} && unzip ${PACKER_ZIPFILE} && \
    rm ${TERRAFORM_ZIPFILE} ${PACKER_ZIPFILE}