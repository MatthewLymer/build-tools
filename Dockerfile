FROM debian:stretch-slim

# install prerequisists
RUN apt-get update \
 && apt-get install -y curl gnupg2 apt-transport-https zip unzip

# install ansible
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
 && APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && apt-get update \
 && apt-get install -y ansible

# install kubectl
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list \
 && curl --silent https://packages.cloud.google.com/apt/doc/apt-key.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add - \
 && apt-get update \
 && apt-get install -y kubectl
 
# install aws-cli
RUN curl --silent "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" --output awscli-bundle.zip \
 && unzip awscli-bundle.zip \
 && ./awscli-bundle/install -b /usr/local/bin/aws \
 && rm awscli-bundle.zip \
 && rm -rf ./awscli-bundle
