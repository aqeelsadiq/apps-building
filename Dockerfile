FROM ubuntu:20.04

ARG RUNNER_VERSION="2.319.1"

# Prevents installdependencies.sh from prompting the user and blocking the image creation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && useradd -m docker
RUN apt install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip


RUN cd /home/docker && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

# make the script executable
RUN chmod +x start.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user
USER docker

ENTRYPOINT ["./start.sh"]



























# FROM ubuntu

# ENV RUNNER_VERSION=2.319.1 

# RUN useradd -m actions \
#     && apt-get update && apt-get install -y wget

# RUN cd /home/actions && mkdir actions-runner && cd actions-runner \
#     && wget https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
#     && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz



# # RUN ./config.sh --url https://github.com/aqeelsadiq/apps-building --token A3JSEDNQBRJ4J24VR2OS2EDG5LPLY
# # RUN ./run.sh

# WORKDIR /home/actions/actions-runner

# RUN chown -R actions ~actions && /home/actions/actions-runner/bin/installdependencies.sh

# USER actions

# ENTRYPOINT ["./start.sh"]














# FROM ubuntu:20.04

# RUN apt-get update && apt-get install -y \
#     curl \
#     git \
#     jq \
#     sudo \
#     && rm -rf /var/lib/apt/lists/*


# RUN mkdir -p /actions-runner
# WORKDIR /actions-runner

# # ENV RUNNER_NAME=my-docker-runner 
# ARG RUNNER_VERSION=2.319.1  

# RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
#     https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz


# RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
# RUN echo "3f6efb7488a183e291fc2c62876e14c9ee732864173734facc85a1bfb1744464  actions-runner-linux-x64-2.319.1.tar.gz" | shasum -a 256 -c
# RUN useradd -m github && chown -R github:github /actions-runner
# RUN ./bin/installdependencies.sh
# RUN ./svc.sh && apt install ./svc.sh
# USER github

# ADD start.sh start.sh
# # ENTRYPOINT ["./start.sh"]
