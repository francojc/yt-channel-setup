# YouTube Channel Setup - ZSH Configuration
# This file contains modern ZSH enhancements for terminal productivity

# Enable Homebrew completions
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

# Starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Atuin for better history
if command -v atuin &> /dev/null; then
    eval "$(atuin init zsh)"
fi

# ZSH syntax highlighting (must be at the end)
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ZSH autosuggestions
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Modern aliases
if command -v exa &> /dev/null; then
    alias ls="exa"
    alias ll="exa -l"
    alias la="exa -la"
    alias tree="exa --tree"
fi

if command -v bat &> /dev/null; then
    alias cat="bat"
fi

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
alias gd="git diff"

# Python/UV aliases
if command -v uv &> /dev/null; then
    alias pip="uv pip"
    alias python="uv run python"
fi

# System monitoring
if command -v glances &> /dev/null; then
    alias top="glances"
fi

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Quick edit
alias zshrc="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"

# YouTube project helpers
alias yt="cd ~/Documents/YouTube"
alias ytscripts="cd ~/Documents/YouTube/Scripts"
alias ytprojects="cd ~/Documents/YouTube/Projects"

# Development shortcuts
alias serve="python -m http.server"
alias ports="lsof -i -P -n | grep LISTEN"
alias myip="curl -s ifconfig.me"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Directory stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward