# Login Info (Must go before Powerlevel10K prompt)
fortune | cowsay

# show available tmux sessions
if [[ -z $TMUX ]]; then
    sessions=$( tmux ls 2> /dev/null | awk '! /attached/ { sub(":", "", $1); print $1; }' | xargs echo )
    if [[ ! -z $sessions ]]; then
        echo "==> Available tmux sessions: $sessions"
    fi
    unset sessions
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DEFAULT_USER="json"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Path to your oh-my-zsh installation.
export ZSH="/home/json/.oh-my-zsh"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git autojump command-not-found httpie pip python vi-mode yarn zsh-autosuggestions zsh-syntax-highlighting colored-man-pages history-substring-search thefuck)

source $ZSH/oh-my-zsh.sh
# Aliases
source ~/.aliasrc

eval $(thefuck --alias) # Add alias for the "fuck" command

# Load Paths
# Adds `~/linuxConfig/scripts` and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/linuxConfig/scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

# Broot tool
source /home/json/.config/broot/launcher/bash/br

# FZF shell bindings (IMPORTANT: These need to go last)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""' # Other options: export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -50'"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZLE_RPROMPT_INDENT=0
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
