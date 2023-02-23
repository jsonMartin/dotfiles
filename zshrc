# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable smart completion
autoload -U compinit
compinit

####################################################################
# ZSH Plugins
####################################################################
plugins=(vi-mode git copyfile extract jsontools node npm urltools vscode web-search z zsh-syntax-highlighting fast-syntax-highlighting zsh-autosuggestions zsh-autocomplete) #zsh-vi-mode plugin has bugs with zsh-autocomplete, #copydir removed on MacOS

# VIM bindings
bindkey "^P" up-line-or-history
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[[5~" up-line-or-history
bindkey "^[[A" up-line-or-history
bindkey "^N" down-line-or-history
bindkey "^[OB" down-line-or-beginning-search
bindkey "^[[6~" down-line-or-history
bindkey "^[[B" down-line-or-history

# Autocomplete
zstyle ':autocomplete:tab:*' widget-style menu-select
####################################################################

source $ZSH/oh-my-zsh.sh

####################################################################
# ZSH THEMES
####################################################################
source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

####################################################################
# Shell Configuration
####################################################################

# Broot tool
# source /home/json/.config/broot/launcher/bash/br

# Mac OS Specific Configuration
source ~/.zshrc_macos

source ~/.aliasrc

# pnpm
export PNPM_HOME="/Users/json/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# bun completions
[ -s "/Users/json/.bun/_bun" ] && source "/Users/json/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
