pip3 install pynvim # Needed for NeoVIM Python plugins

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false # Without this, cannot press and hold a key in VSCode, such as using "j" to move line down in vim (https://stackoverflow.com/questions/39972335/how-do-i-press-and-hold-a-key-and-have-it-repeat-in-vscode)

# Fish
fish_add_path /opt/homebrew/bin # Required to make Fish work as default shell (https://stackoverflow.com/questions/66724016/my-fish-is-blind-fish-does-not-recognise-any-commands-after-setting-it-as-defa)

# Enable ctrl + cmd + click to drag Window anywhere: https://mmazzarolo.com/blog/2022-04-16-drag-window-by-clicking-anywhere-on-macos/
defaults write -g NSWindowShouldDragOnGesture -bool true
