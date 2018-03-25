#!/usr/bin/env bash

set -e
git config --global user.email circleci@circleci.com
git config --global user.name CircleCI
pushd src
make build && cp -a _site/. ..
popd
git status && git add -A .
git commit -m "Update (`date '+%F %T %Z'`) [ci skip]"
git fetch && git rebase
git push
