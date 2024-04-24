#
### GLOBAL VARIABLES
#

function fish_greeting
    krabby random -i
end

# Load private config
# (local settings or computer specific config for example)
if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
end

# Colors for ls command
set -gx LSCOLORS "Cxbgdxdxbxdgeghegeacad"

# Keys binding
bind "^X\\x7f" backward-kill-line

# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

switch (uname)
case Linux
    set -x OSTYPE "Linux"
case Darwin
    set -x OSTYPE "MacOS"
case FreeBSD NetBSD DragonFly
    set -x OSTYPE "FreeBSD"
case '*'
    set -x OSTYPE "unknown"
end

## ENV

# Fish 3.1+ doesn't add binaries to the path autmatically anymore
# https://github.com/fish-shell/fish-shell/issues/6594
contains /usr/local/bin $PATH
or set PATH /usr/local/bin $PATH
# On M1 Macs, homebrew installs things in /opt/homebrew
contains /opt/homebrew/bin
or set PATH /opt/homebrew/bin $PATH

if [ -f $HOME/.config/fish/env/index.fish ]
    source $HOME/.config/fish/env/index.fish
end

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# Private aliases (e.g. with servers address...)
## aliases/private.fish will be ignored by git (.gitignore)
if [ -f $HOME/.config/fish/aliases/private.fish ]
    source $HOME/.config/fish/aliases/private.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
    source $HOME/.config/fish/aliases/git.fish
end



# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# fish_prompt defined in ~/.config/fish/functions/fish_prompt.fish
starship init fish | source

source /opt/homebrew/opt/asdf/libexec/asdf.fish
