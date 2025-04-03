
autoload -Uz compinit && compinit -d "$ZSH_COMPDUMP"
autoload -U colors && colors

#------------------------------------------------MY EDITS---------------------------------------------------

# Shell options
setopt append_history inc_append_history share_history
setopt autocd
setopt no_case_glob no_case_match
setopt globdots
setopt interactivecomments

# System info show on login shell (no root).
[ "$(tty)" != "/dev/tty1" ] && [ "$EUID" -ne 0 ] && fastfetch && echo "" && lsd
# My aliases and functions.
[ -f "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"
[ -f "$XDG_CONFIG_HOME/shell/functions" ] && source "$XDG_CONFIG_HOME/shell/functions"

# SCREENSAVER
# TMOUT=300
# TRAPALRM() {
	# SCRSVR=$(shuf -i 0-1 -n 1)
	# if [[ $SCRSVR -eq 0 ]]; then
		# pipes
		# return 0
	# else
		# matrix
		# return 0
	# fi
# }

# SHIFT+ARROW SELECTION
bindkey -e

function zle-line-init {
    marking=0
}
zle -N zle-line-init

function select-char-right {
    if (( $marking != 1 )) 
    then
        marking=1
        zle set-mark-command
    fi
    zle .forward-char
}
zle -N select-char-right

function select-char-left {
    if (( $marking != 1 )) 
    then
        marking=1
        zle set-mark-command
    fi
    zle .backward-char
}
zle -N select-char-left

function forward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .forward-char
}
zle -N forward-char

function backward-char {
    if (( $marking == 1 ))
    then
        marking=0
        NUMERIC=-1 zle set-mark-command
    fi
    zle .backward-char
}
zle -N backward-char

function delete-char {
    if (( $marking == 1 ))
    then
        zle kill-region
        marking=0
    else
        zle .delete-char
    fi
}
zle -N delete-char

bindkey '^[[1;2D' select-char-left
bindkey '^[[1;2C' select-char-right

# AUTO CLOSE PARENTHESIS:
source $XDG_CONFIG_HOME/zsh/zsh-autopair/autopair.zsh
autopair-init

# SYNTAX HIGHLIGHTING:
source $XDG_CONFIG_HOME/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh	# Añadimos el archivo.
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)			# Le decimos que funcionen estas cosas.
																	# Lo que sigue aquí es para cambiar los colores.
typeset -A ZSH_HIGHLIGHT_STYLES										# Sobre-escribimos la variable.
# Ejemplo: ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'				# Lo que está después del 'fg=' es el nuevo estilo,
																	# mientras que lo que está entre [] es lo que cambiará.
																	# Para una lista completa de lo que se puede cambiar:
																	# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
																	# ------- Palabras reservadas ------
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#7A8478'				# Comando no reconocido
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'						# Los comandos integrados de la shell.
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'						# El resto de comandos (instalables y desinstalables).
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold'					# Modificadores, como "sudo"
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'							# Los aliases.
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'						# Nombre de funciones.
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red,bold'					# Otras palabras reservadas, como `while` y `for`.
																	# ------ Opciones de Comandos ------
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'				# Opciones directas, como "-la"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'				# Opciones indirectas, como "--remove"
																	# ----------- Quotations -----------
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan,bold'			# Comillas simples.
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan,bold'			# Comillas dobles.
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=blue,bold'			# Quotes con dólar.
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=blue'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=blue'			# Para los backslashes.
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=blue'
																	#---------------Symbols-------------
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=red'		# `$(` and `)`.
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'						# `&&`, `||`, `;`
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'							# `>` and `<`.
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=red'		# `<(` and `)`.

																	#-------------- Otros --------------
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta,underline'					# Ubicaciones existentes del sistema.
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=magenta,underline'			# Ubicaciones existentes del sistema.
ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=magenta'				# Números.
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=magenta'						# Otros números más raros.
ZSH_HIGHLIGHT_STYLES[assign]='fg=blue'								# Asignación de variables.
ZSH_HIGHLIGHT_STYLES[comment]='fg=#859289'							# Comentarios.

# AUTOSUGGESTIONS
source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#374145"

# PROMPT
eval "$(starship init zsh)"
# source $XDG_CONFIG_HOME/zsh/transient-prompt/transient-prompt.zsh
# Colors for LS and LSD.
eval $(dircolors -b ~/.dircolors)
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=("$HOME/.juliaup/bin" $path)
export PATH

# <<< juliaup initialize <<<
