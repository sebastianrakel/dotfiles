#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source ${HOME}/.profile

