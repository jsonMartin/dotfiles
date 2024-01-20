if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.aliasrc

set -g fish_key_bindings fish_vi_key_bindings

function reverse_history_search
  history | fzf --no-sort | read -l command
  if test $command
    commandline -rb $command
  end
end

function fish_user_key_bindings
  bind -M default / reverse_history_search
  bind -M default \cr reverse_history_search
  bind -M insert \cr reverse_history_search
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# pnpm
set -gx PNPM_HOME "/Users/json/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# vscode terminal integration
string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

[ -f ~/.inshellisense/key-bindings.fish ] && source ~/.inshellisense/key-bindings.fish
