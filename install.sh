#!/bin/bash

cd "$(dirname "$0")"

git pull

cp -rf opt/ /
cp -rf home/ /
cp -rf etc/ /
