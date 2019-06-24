set fish_greeting

cat ~/.todo

set -x BEMENU_BACKEND wayland
set -x TERMINAL tilix
set -x EDITOR "emacsclient -t"
set -x GIT_EDITOR "emacsclient -t"
set -x GOPATH $HOME/projects/go
set -x CARGOPATH $HOME/.cargo
set -x SSH_AUTH_SOCK (gnome-keyring-daemon --start | awk -F= '{print  $2}')

set PATH $GOPATH/bin /sbin /usr/sbin $HOME/.bin $CARGOPATH/bin $PATH

alias emacs="emacsclient -t"
alias outputs="swaymsg -t get_outputs"
alias bs="docker run --rm -v ~/.config/osc/oscrc:/root/.config/osc/oscrc -v ~/projects/suse/ibs:/root/ibs -v ~/projects/suse/obs:/root/obs -it ereslibre/buildservice"

if type -q keychain; and not set -q WINDOW_MANAGER
    keychain --nogui $HOME/.ssh/id_rsa ^/dev/null
    source $HOME/.keychain/(hostname)-fish
end
