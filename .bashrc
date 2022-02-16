#
# ~/.bashrc
#

# If not running interactively, do nothing.
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias lswifi='nmcli device wifi list'

PS1='[\u@\h \w]\$ '

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
