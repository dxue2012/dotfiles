#bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# make the command line history ignore duplicate command lines
history_control=ignoredups

# Make editor VIM
export EDITOR=vim

# Create aliases for commonly used commands
alias ls="ls -GFp"
alias lsd="ls -d1 */"
