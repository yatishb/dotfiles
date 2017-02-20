#! /bin/bash

echo "
export PS1='\\[\\033[01;32m\\]\\h\\[\\033[01;34m\\] \\w\\[\\033[31m\\]\$(__git_ps1 \"(%s)\") \\[\\033[01;34m\\]$\\[\\033[00m\\] '
export EDITOR=vim
" >> ~/.bashrc

echo "Settings added! Logout and login again for your settings to take effect"
