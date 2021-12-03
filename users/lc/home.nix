{ config, lib, pkgs, ... }: {

  imports = [
    ./modules/desktop.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/neovim.nix
   ];

  home.packages = with pkgs; [
  ];
}
