#bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# make the command line history ignore duplicate command lines
history_control=ignoredups

# Make editor VIM
export EDITOR=vim

# emacsclient
# export ALTERNATE_EDITOR=""
# export EDITOR=emacsclient

# alias emacs="emacsclient -nw -a ''"
# alias emacsclient=ec

# Create aliases for commonly used commands
# alias ls="ls -GFpa"
# alias lsd="ls -d1 */"
# alias rm="rm -i"
alias ob="ocamlbuild"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/bin

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

## Add mysql
export PATH="/usr/local/mysql/bin:$PATH"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

### Add virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

### Add CoqIDE
export PATH="/opt/homebrew-cask/Caskroom/coqide/8.4pl5/CoqIDE_8.4pl5.app/Contents/MacOS:$PATH"


### RVM
source ~/.rvm/scripts/rvm
export PATH="$HOME/.rvm/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


export DJANGO_DEBUG=True

export PATH="$PATH:."

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
### shortcuts

alias hd="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

alias sd="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias ga="git add ."

alias gpo="git push origin"

function gcm
{
    git commit -m "$1"
}

### tmuxinator
source ~/.bin/tmuxinator.bash

# must have .fav_dirs in home directory
function cdf
{
    echo 'cd '$(grep -i "^\S*$1" ~/.fav_dirs | awk '(NR==1){print $2}')/$2
    cd $(grep -i "^\S*$1" ~/.fav_dirs | awk '(NR==1){print $2}')/$2
}
function openf
{
    open $(grep -i "^\S*$1" ~/.fav_dirs | awk '(NR==1){print $2}')/$2
}
function editf
{
    vim $(grep -i "^\S*$1" ~/.fav_files | awk '(NR==1){print $2}')/$2
}
function addf
{
    echo $1 $(pwd) >> ~/.fav_dirs
    sort ~/.fav_dirs > ~/.fav_dirs.temp && mv -f ~/.fav_dirs.temp ~/.fav_dirs
}
function lsf
{
    cat ~/.fav_dirs
}
