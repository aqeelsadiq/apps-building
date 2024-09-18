FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    jq \
    sudo \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /actions-runner
WORKDIR /actions-runner

# ENV RUNNER_NAME=my-docker-runner 
ARG RUNNER_VERSION=2.319.1  

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
    https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz


RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
RUN echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c
RUN useradd -m github && chown -R github:github /actions-runner


USER github

ADD start.sh start.sh
# ENTRYPOINT ["./start.sh"]
