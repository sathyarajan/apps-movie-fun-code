#!/bin/bash

set -e +x

pushd apps-movie-fun-code-source
  echo "Packaging WAR"
  ./mvnw clean package -DskipTests
popd

jar_count=`find apps-movie-fun-code-source/target -type f -name *.war | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find apps-movie-fun-code-source/target -type f -name *.war -exec cp "{}" package-output/movie-app.war \;

echo "Done packaging"
exit 0

