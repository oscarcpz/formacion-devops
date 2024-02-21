FROM debian:12-slim

VOLUME /workspace

RUN apt-get update && apt-get install -y gnupg software-properties-common wget
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
# install terraform
RUN apt-get update && apt-get install -y terraform curl
# install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

