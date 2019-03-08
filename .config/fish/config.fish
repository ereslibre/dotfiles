set fish_greeting

cat ~/.todo

set -x TERMINAL tilix
set -x EDITOR "emacsclient"
set -x GIT_EDITOR "emacsclient"
set -x GOPATH $HOME/projects/go
set -x CARGOPATH $HOME/.cargo
set -x SSH_AUTH_SOCK (gnome-keyring-daemon --start | awk -F= '{print  $2}')

set PATH /sbin /usr/sbin $HOME/.bin $GOPATH/bin $CARGOPATH/bin /usr/local/kubebuilder/bin $PATH

alias iosc="osc -A https://api.suse.de"

if type -q keychain; and not set -q WINDOW_MANAGER
    keychain --nogui $HOME/.ssh/id_rsa ^/dev/null
    source $HOME/.keychain/(hostname)-fish
end
