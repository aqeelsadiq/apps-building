#!/bin/bash

OWNER=$1
RUNNER_REPO=$2
ACCESS_TOKEN=$3
NAME=$4

echo ${NAME} | ./config.sh --url https://github.com/${OWNER}/${RUNNER_REPO} --token ${ACCESS_TOKEN}

./run.sh





# echo "Configuring the GitHub Actions runner..."

# cd /actions-runner

# ./config.sh --unattended --url https://github.com/${RUNNER_REPO} --token ${RUNNER_TOKEN}

# echo "GitHub Actions runner configured successfully for repository: ${RUNNER_REPO}"

# ./run.sh