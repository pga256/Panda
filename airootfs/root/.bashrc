#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='[\[\033[31m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\W\[\033[00m\]]\$ '
