#!/bin/bash
#!/bin/bash

RUNNER_REPO=$RUNNER_REPO
ACCESS_TOKEN=$ACCESS_TOKEN

echo "REPO ${RUNNER_REPO}"
echo "ACCESS_TOKEN ${ACCESS_TOKEN}"

REG_TOKEN=$(curl -X POST -H "Authorization: token ${ACCESS_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/actions-runner

./config.sh --url https://github.com/${RUNNER_REPO} --token ${REG_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!





















# OWNER=$1
# RUNNER_REPO=$2
# ACCESS_TOKEN=$3
# NAME=$4

# echo ${NAME} | ./config.sh --url https://github.com/${OWNER}/${RUNNER_REPO} --token ${ACCESS_TOKEN}

# ./run.sh





# echo "Configuring the GitHub Actions runner..."

# cd /actions-runner

# ./config.sh --unattended --url https://github.com/${RUNNER_REPO} --token ${RUNNER_TOKEN}

# echo "GitHub Actions runner configured successfully for repository: ${RUNNER_REPO}"

# ./run.sh