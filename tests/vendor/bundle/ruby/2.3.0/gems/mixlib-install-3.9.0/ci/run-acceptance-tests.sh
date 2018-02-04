#!/bin/bash

set -evx

# Don't run acceptance tests on forks. The decryption keys are not available.
if [[ $SUITE ]] && [[ $encrypted_e2edbb28e76c_key ]]; then
  # setup acceptance tests
  cd acceptance
  export BUNDLE_GEMFILE=$PWD/Gemfile
  bundle install
  # run acceptances tests and force cleanup
  bundle exec chef-acceptance test $SUITE --force-destroy
fi
