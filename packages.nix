{ devenv, pkgs }:
[ devenv.packages.${pkgs.stdenv.system}.devenv ] ++ (with pkgs;
  [
    awscli
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
    yubikey-manager
    zstd
  ] ++ (with pkgs; lib.optionals stdenv.isLinux [ kube3d valgrind ])
  ++ (with pkgs; lib.optionals (stdenv.system != "aarch64-darwin") [ yq zbar ]))
