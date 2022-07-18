# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Enable smart completion
autoload -U compinit
compinit

####################################################################
# ZSH Plugins
####################################################################
plugins=(vi-mode git copypath copyfile extract jsontools node npm urltools vscode web-search zsh-z zsh-syntax-highlighting fast-syntax-highlighting zsh-autosuggestions zsh-autocomplete) #zsh-vi-mode plugin has bugs with zsh-autocomplete

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
# Pipe SSH-Agent to Windows
#
# https://stuartleeks.com/posts/wsl-ssh-key-forward-to-windows/
# https://nxn.io/posts/vscode_remote/

# 1Password Config:
# https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent
####################################################################
# Route SSH Agent Forwarding to Windows Host's ssh-agent
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock

ss -a | grep -q $SSH_AUTH_SOCK

if [ $? -ne 0 ]; then

    rm -f $SSH_AUTH_SOCK

    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) > /dev/null 2>&1

fi
####################################################################
# Shell Configuration
####################################################################

# Broot tool
# source /home/json/.config/broot/launcher/bash/br

# Set default editor to vim
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

source ~/.aliasrc
