#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Mac Get Bundle ID
# @raycast.mode compact

# Required parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "App ID" }

# Documentation:
# @raycast.description Mac Bundle ID
# @raycast.author jsonMartin

osascript -e 'id of app "'"$1"'"'