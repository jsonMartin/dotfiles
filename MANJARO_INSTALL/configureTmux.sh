#!/bin/bash

# Install TMUX theme & functionality from gpakosz repo: https://github.com/gpakosz/.tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
