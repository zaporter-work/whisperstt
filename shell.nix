{pkgs ? import <nixpkgs> {}}: let
  unstableTarball =
    fetchTarball
    https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
  pkgs = import <nixpkgs> {};
  unstable = import unstableTarball {};
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      opusTools
      unstable.cargo
      unstable.rustc
      unstable.rust-analyzer
      openssl
      alsa-lib
      alsa-utils
      vlc
    ];
    shellHook = ''
      export PKG_CONFIG_PATH=${pkgs.alsa-lib.dev}/lib/pkgconfig:$PKG_CONFIG_PATH
      export OPENSSL_DIR=${pkgs.openssl.dev}
      export OPENSSL_LIB_DIR=${pkgs.openssl.out}/lib
      export OPENSSL_INCLUDE_DIR=${pkgs.openssl.dev}/include
      export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig:$PKG_CONFIG_PATH
    '';
  }
