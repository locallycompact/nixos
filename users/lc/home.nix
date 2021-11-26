{ config, lib, pkgs, ... }: {

  imports = [
    ./modules/git.nix
    ./modules/neovim.nix
   ];

  home.packages = with pkgs; [
  ];
}
