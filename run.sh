#!/bin/sh

set -e

if [ ! -n "$RELEASE_TAG" ]; then
    echo "no release tag"
    exit 0
fi

if [ ! -n "$GITHUB_TOKEN" ]; then
    echo "no release github token"
    exit 0
fi

git clone git@github.com:peco/homebrew-peco.git
cd homebrew-peco             
go run make.go peco $RELEASE_TAG
git commit -m "Update version" peco.rb
REMOTE="https://$GITHUB_TOKEN@github.com/peco/homebrew-peco.git"
git push $REMOTE master   