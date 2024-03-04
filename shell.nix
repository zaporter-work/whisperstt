{pkgs ? import <nixpkgs> {}}: let
  unstableTarball =
    fetchTarball
    https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
  pkgs = import <nixpkgs> {};
  unstable = import unstableTarball {};
in
  pkgs.mkShell {
    buildInputs= with pkgs; [
        opusTools
        unstable.cargo
        unstable.rustc
        alsa-lib
        alsa-utils
        unstable.rust-analyzer
        vlc

    ];
    shellHook = ''
      export PKG_CONFIG_PATH=${pkgs.alsa-lib.dev}/lib/pkgconfig:$PKG_CONFIG_PATH
    '';
  }
