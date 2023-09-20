#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Kill and DELETE all running docker containers
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author jsonMartin
# @raycast.authorURL https://jsonmart.in

docker rm -f $(docker ps -aq)
