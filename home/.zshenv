#! /usr/bin/sh

# XDG-standards.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Move ZSH config to .config/zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Editor de terminal por defecto
export VISUAL=/usr/bin/edit
export EDITOR="$VISUAL"
export "MICRO_TRUECOLOR=1"

# Language paths
export PYTHONPATH="${PYTHONPATH}:$HOME/.local/bin"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Export other PATH variables.
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.juliaup/bin:$PATH
export PATH=$GOBIN:/usr/local/go/bin:$PATH

# History
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
SAVEHIST=2000
