{ pkgs }:
with pkgs;
[
  awscli
  bat
  binutils
  cacert
  coreutils
  curl
  direnv
  coreutils
  dive
  file
  fluxcd
  fzf
  gdb
  gh
  git
  gnumake
  gnupg
  gnupg-pkcs11-scd
  go
  gopls
  gotools
  kubernetes-helm
  htop
  jq
  just
  keychain
  kubectl
  kubeseal
  mtr
  otpauth
  reg
  ripgrep
  rlwrap
  rnix-lsp
  rust-analyzer
  rustup
  terraform
  tmux
  tree
  velero
  wget
  xxd
  zstd
] ++ (with pkgs;
  lib.optionals stdenv.isLinux [ conmon gcc kube3d podman valgrind ])
++ (with pkgs;
  lib.optionals (stdenv.system != "aarch64-darwin") [ yubikey-manager yq zbar ])
