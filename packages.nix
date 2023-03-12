{ devenv, pkgs }:
[ devenv.packages.${pkgs.stdenv.system}.devenv ] ++ (with pkgs; [
  bat
  binutils
  cacert
  coreutils
  curl
  diffutils
  direnv
  dive
  file
  fluxcd
  fzf
  gh
  git
  gnumake
  gnupg
  gnupg-pkcs11-scd
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
  # otpauth
  reg
  ripgrep
  rlwrap
  rnix-lsp
  rust-analyzer
  rustup
  terraform
  tree
  velero
  wget
  xxd
  yubikey-manager
  zstd
]) ++ (with pkgs; lib.optionals stdenv.isLinux [ kube3d ])
