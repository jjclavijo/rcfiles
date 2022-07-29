# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

#
# ------------------
# ZIM
# ------------------
#



# ------------------
# Initialize modules
# ------------------

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

#
# User configuration sourced by interactive shells
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/javier/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

tos_2_csv() {
    $HOME/bin/tos-cli -i "$1" -o "$2" -f carlson_rw5 -t csv
}

for i in $(ls $HOME/envs/)
do
	alias env_$i=". \"$HOME/envs/$i/bin/activate\""
done

# Set user bin to path ##
#
typeset -U path
path=(~/.local/bin $path[@])
#
#########################
# Set user fbin to fpath ##
#
typeset -U fpath
fpath=(~/.local/fbin $fpath[@])
#
#########################

autoload -Uz promptinit
  promptinit
if [ `tput colors` = "256" ]; then  
  prompt eriner
else
  prompt steeef
fi

export VISUAL=vim
export EDITOR=vim


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/javier/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/javier/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/javier/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/javier/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Modulos
#

# Aliases

# Para limpiar los notebooks y que se diffeen tranquilos con git.

alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"

# Zettelvim

#alias zvim="gvim -Nu ~/zettel/.vimrc"

alias texvim="vim -u ~/proy/sway-inkscape-mgr/vimconf/vimrc"

alias CARtoRinex="/home/javier/proy/g-fot/g-fot/.stack-work/dist/x86_64-linux-tinfo6/Cabal-3.0.1.0/build/g-fot-exe/g-fot-exe"

alias browser-sync="~/node_modules/browser-sync/dist/bin.js"
alias get_download='mv "`fd . ~/Downloads/ | fzf`" .'
alias mv_download='mv "`fd . ~/Downloads/ | fzf`" "`fd . $HOME -t d | fzf`"'

alias get_just_downloaded='mv "`fd . ~/Downloads/ --changed-within 1d | fzf`" .'
alias mv_just_download='mv "`fd . ~/Downloads/ --changed-within 1d | fzf`" "`fd . $HOME -t d | fzf`"'
alias fcd='cd "$(fd . -t d | fzf)"'
alias dragon='dragon-drag-and-drop "$(fd . $HOME | fzf)"'

# Para buscar entornos virtuales
alias fzenv='echo "$(fd . -t l python | fzf)"'

aurfzf() {
  curl -s -L "https://ddg.gg/html/?q=!aur+$@" |\
    grep "packages/[^\"\'\?].*" |\
    sed -E 's/^.*href=\"\/packages\/([^\"]*)\/?\".*$/\1/' |\
    fzf |\
    xargs -p -I{} git clone https://aur.archlinux.org/{}.git
}

# para ejecutar acciónes cuando se modifica un archivo.
#

onmodify() {
      TARGET=${1:-.}; shift
      CMD="$@"

      echo "$TARGET" "$CMD"
      while inotifywait --exclude '.git' -qq -r -e close_write,moved_to,move_self $TARGET; do
          sleep 0.2
          bash -c "$CMD"
          echo
      done
      }

. $HOME/.tokens

export QT_PLUGIN_PATH=/usr/lib/qt/plugins
#export QT_QPA_PLATFORM=wayland
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

alias fzfpdf="fd --glob '*.pdf' . | fzf --preview 'pdftotext {} - | head -n 500' | xargs zathura"

#Zsh system clipboard
typeset -g ZSH_SYSTEM_CLIPBOARD_USE_WL_CLIPBOARD='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

# Calculadora
#

typeset -F calcAns

calc() {
  read calcAns < <(python3 -c "from math import *; print($*);")
  echo $calcAns
}
alias calc='noglob calc'
#alias vim='vim -c ":call Transparente()"'

# zettel
#

newzettel() {
  vim .nombreimposible -s <(echo :setfiletype markdown.zettel\\n:NewZettel\\n:bdelete .nombreimposible)
}

# Hooks
#

eval "$(fasd --init auto)"
#eval "$(micromamba shell hook -s zsh)"

export MOZ_ENABLE_WAYLAND=1
