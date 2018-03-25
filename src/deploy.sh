#!/usr/bin/env bash

set -e

cd src/ && find .. -maxdepth 1 -type d | grep -v .git | grep -v ../src | grep -v ^\.\.$ | xargs -r rm -r
cd src/ && find .. -maxdepth 1 -type f | grep -v .git | grep -v circle\.yml | xargs -r rm
git config --global user.email circleci@circleci.com
git config --global user.name CircleCI
cd src/ && make build && cp -a _site/. ..
git status && git add -A .
git commit -m "Update (`date '+%F %T %Z'`) [ci skip]"
git fetch && git rebase
git push
