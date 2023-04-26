FROM ubuntu:latest

RUN apt update -y; apt install -y \
    curl \
    git \
    tar \
    zip

# Install Docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh ./get-docker.sh

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    unzip awscliv2.zip; \
    sh ./aws/install

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
