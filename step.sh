#!/bin/bash
set -ex

MESSAGE="🛑 *$BITRISE_APP_TITLE*: build $BITRISE_BUILD_NUMBER failed 💔 \nURL: $BITRISE_APP_URL\nCommit: $BITRISE_GIT_COMMIT - $BITRISE_GIT_MESSAGE \nGit URL: $GIT_REPOSITORY_URL \n"

if [ $BITRISE_BUILD_STATUS -eq 0 ] ; then MESSAGE="✅ *$BITRISE_APP_TITLE*: build $BITRISE_BUILD_NUMBER passed! 💚\nURL: $BITRISE_APP_URL\n" ; fi

curl https://discord.com/api/webhooks/$DISCORD_WEBHOOK_ID/$DISCORD_WEBHOOK_TOKEN \
  -H 'content-type: application/json' \
  --data-binary "{\"content\": \"$MESSAGE\"}" \
  --compressed
