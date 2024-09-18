#!/bin/bash


echo "Configuring the GitHub Actions runner..."

cd /actions-runner

./config.sh --unattended --url https://github.com/${RUNNER_REPO} --token ${RUNNER_TOKEN}

echo "GitHub Actions runner configured successfully for repository: ${RUNNER_REPO}"

./run.sh