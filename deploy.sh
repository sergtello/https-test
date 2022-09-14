#!/bin/bash
# DEV Deployment
API_ENV=dev
echo "Deploying to ${API_ENV} environment..."
echo ""
echo "Updating repository:"
#cd ../dev/api/
#cd ../
#git checkout release/AWSdeployment

git checkout test

git remote update

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "The API ${API_ENV} instance is up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    GIT_PULL=$(git pull)
    echo "${GIT_PULL}"
    if [[ $(echo "${GIT_PULL}" | grep 'index.html') ]]; then
        echo "HTML file has changed"
    else
        echo "HTML file has NOT changed"
    fi
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi


# shellcheck disable=SC2143
#if [[ $(git status --porcelain | grep ".env") ]]; then
  # Changes
#  echo "Rebuilding image"
#  echo "Installing dependencies"
#else
  # No changes
#  echo "Updating files"
#fi
#echo "Installing dependencies:"
#npm install
#echo "Running build:"
#npm run build
#echo "Copying to PRD server:"
#rsync -azvvP --no-p build/ portalgrow@nerv:/home3/portalgrow/imperium.cool/explorer/blue-chips/

