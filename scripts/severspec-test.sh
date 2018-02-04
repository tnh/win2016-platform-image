#!/bin/sh

echo "--- pulling down pem for windows"
aws s3 cp s3://cevo-buildkite-secrets/win2016-platform-image/somepem.pem somepem.pem 


echo "--- exporting environment variables"
export KITCHEN_SSH_KEY_NAME=something
export KITCHEN_SSH_KEY_PEM=somepem.pem

echo "--- loading in the latest image id"
export SERVER_IMAGE_ID=ami-0b206131

echo "--- setting up tests"

cd /build/tests
bundle install


echo "--- booting the ami"

echo "--- finding the admin password for the ami"

echo " aws get-server-info whatever call"
export WINDOWS_PASSWORD="somepass"

echo "--- running tests"
bundle exec kitchen test

