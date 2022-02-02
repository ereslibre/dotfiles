{ config, pkgs }:
let macFiles = import ./mac.nix { inherit config pkgs; };
in {
  ".emacs.d" = {
    source = ./assets/emacs/emacs.d;
    recursive = true;
  };
  ".gitconfig".source = ./assets/git/config;
  ".gitconfig.suse".source = ./assets/git/config-suse;
  ".gitignore".source = ./assets/git/gitignore;
  ".ssh/config".source = ./assets/ssh/config;
  ".tmux.conf".source = ./assets/tmux/config;
} // macFiles
