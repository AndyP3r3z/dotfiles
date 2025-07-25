#! /usr/bin/sh

# XDG-standards.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Move ZSH config to .config/zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Default terminal editor.
export VISUAL=/usr/bin/edit
export EDITOR="$VISUAL"
export "MICRO_TRUECOLOR=1"

# Language paths.
export PYTHONUSERBASE="$XDG_DATA_HOME/python"
export PYTHONPATH="${PYTHONPATH}:$PYTHONUSERBASE/bin"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export XCOMPOSEFILE="$XDG_CONFIG_HOME/ibus/Compose"

# Export other PATH variables.
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOBIN:/usr/local/go/bin:$PATH"
export XCURSOR_PATH="$XDG_DATA_HOME/icons"

# History.
export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth
export SAVEHIST=2000
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
