#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="firefox"
export USER_SCRIPTS="$HOME/.scripts"
export PATH=$PATH:$USER_SCRIPTS:/usr/local/go/bin

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
