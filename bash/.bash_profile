#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-naked'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

export PATH=$PATH:/usr/local/sbin

export PATH=$PATH:/Library/TeX/Root/bin/x86_64-darwin

CAML_LD_LIBRARY_PATH="/Users/dylandxue2012/.opam/system/lib/stublibs:/usr/local/lib/ocaml/stublibs"; export CAML_LD_LIBRARY_PATH;
OPAMUTF8MSGS="1"; export OPAMUTF8MSGS;
MANPATH="/Users/dylandxue2012/.opam/system/man:"; export MANPATH;
MAKELEVEL=""; export MAKELEVEL;
MAKEFLAGS=""; export MAKEFLAGS;
PERL5LIB="/Users/dylandxue2012/.opam/system/lib/perl5"; export PERL5LIB;
OCAML_TOPLEVEL_PATH="/Users/dylandxue2012/.opam/system/lib/toplevel"; export OCAML_TOPLEVEL_PATH;

export PATH=/Users/dylandxue2012/.opam/system/bin:$PATH

# Load Bash It
source $BASH_IT/bash_it.sh
