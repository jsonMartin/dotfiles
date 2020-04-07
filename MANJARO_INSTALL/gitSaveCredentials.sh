#!/bin/bash

# This script configures git to save username and password for working with https repositories
# More information can be found here: https://www.freecodecamp.org/news/how-to-fix-git-always-asking-for-user-credentials/

git config --global credential.helper store # Make Git store the username and password and it will never ask for them
git config --global credential.helper cache # Save the username and password for a session (cache it)
