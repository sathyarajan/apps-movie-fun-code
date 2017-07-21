#!/bin/bash

set -ex

if [ -z $MOVIE_APP_URL ]; then
  echo "MOVIE_APP_URL not set"
  exit 1
fi

pushd apps-movie-fun-code-source
  echo "Running smoke tests for Movie Fun App deployed at $MOVIE_APP_URL"
  apt-get update && apt-get install -y curl
  smoke-tests/bin/test $MOVIE_APP_URL
popd

exit 0

