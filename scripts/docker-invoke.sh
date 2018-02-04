
BUILD_CONTAINER=${1:?"Specify build container"}
RUNSCRIPT=${2:?"Specify script to run"}
BUILD_DIR=$(pwd)

set -eo pipefail

set +e

echo "--- :docker: pulling down the build container"
docker pull ${AWS_DOCKER_ARN}/${BUILD_CONTAINER}:latest

echo "--- :docker: invoking the command"

docker run \
    -e ${BUILDKITE_COMMIT} \
    -e ${BUILDKITE_BUILD_NUMBER} \
    -e ${BUILDKITE_BRANCH} \
    -e ${BUILDKITE_BRANCH} \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${BUILD_DIR}:/build \
    ${AWS_DOCKER_ARN}/${BUILD_CONTAINER}:latest ${RUNSCRIPT}
