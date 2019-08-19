#!/bin/bash

set -eu

mkdir volumes/factory
mkdir volumes/factory/.ivy2
mkdir volumes/webapp

cd volumes/factory
git clone --recursive https://github.com/JotaroAbe/CurationmapFactory.git
cp -r ../../build/factory/local .ivy2

cd ../webapp
git clone --recursive https://github.com/JotaroAbe/CurationmapViewer.git
cd ../../

docker-compose build --no-cache
