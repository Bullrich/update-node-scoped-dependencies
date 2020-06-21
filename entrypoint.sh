#!/bin/bash
set -eu

npx npm-check-updates -u
npm i --package-lock-only

PR_BRANCH=chore/deps-$(date +%s)
DESCRIPTION="chore: update deps (automated)"

git config user.name "node-update-deps"
git config user.email "node-update-deps@neverendingqs.com"
git checkout -b ${PR_BRANCH}
git commit -am "${DESCRIPTION}"
git push origin ${PR_BRANCH}

bin/hub pull-request -m "${DESCRIPTION}"