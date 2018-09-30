# Profiling Start #############################################################

# Let zprof generate a report on startup
# zmodload zsh/zprof

# Generate an xtrace file
# PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
# exec 3>&2 2>~/.zshstart.$$.log
# setopt xtrace prompt_subst

###############################################################################

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename $HOME/.zshrc

################################################################################
# Completion settings
################################################################################

# Manually generated completions from user-installed packages
fpath=($HOME/.dotfiles/zsh/my-completions $fpath)

# Built-in completions
fpath=(/usr/local/share/zsh-completions $fpath)

# up arrow history completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Allow completion navigation with arrow keys
zstyle ":completion:*" menu select

# Separate completions by group/category
zstyle ':completion:*' format $'Completing %d\n'

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-z}={A-Za-z}'

# colors: magenta, green, blue,cyan, yellow, red
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' format $'\n%F{yellow}Completing %d%f\n'
zstyle ':completion:*' group-name ''

# Only check whether the .zcompdump file needs to be reloaded
# once per day, rather than every time the shell loads.
autoload -Uz compinit
if [ $(uname) = Linux ]; then
  if [ $(expr $(expr $(date +"%s") - $(stat -c %Y $HOME/.zcompdump)) \> 86400) ]; then
    compinit
  else
    compinit -C
  fi
else
  if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' $HOME/.zcompdump) ]; then
    compinit
  else
    compinit -C
  fi
fi

################################################################################
# base16-shell support
################################################################################

# Needed for (neo)vim's base16 color support
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

################################################################################
# Tweaks
################################################################################

# auto-cd
setopt auto_cd

################################################################################
# Separate configs
################################################################################

autoload -U add-zsh-hook
source $HOME/.dotfiles/zsh/prompt
source $HOME/.dotfiles/zsh/aliases
source $HOME/.dotfiles/zsh/dev

##############################################################################
# Plugins
##############################################################################

export ZDOTDIR=$HOME/.dotfiles/zsh

# Extra completions
# https://github.com/zsh-users/zsh-completions
fpath=($HOME/.dotfiles/zsh/zsh-completions $fpath)

# Colored man-pages
# https://github.com/zuxfoucault/colored-man-pages_mod
source $HOME/.dotfiles/zsh/colored-man-pages_mod/colored-man-pages_mod.plugin.zsh

# Syntax highlighting of shell commands
# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Command line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,.virtualenvs}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--no-height --no-reverse --preview 'cat {}'"
export FZF_ALT_C_COMMAND="fd -a -p -L --type directory '\.*/\.*' /etc /usr $HOME 2> /dev/null"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Profiling ###################################################################

# Turn off zprof once .zshrc has been sourced
# zprof

# Turn off xtrace once .zshrc has been sourced
# unsetopt xtrace
# exec 2>&3 3>&-
