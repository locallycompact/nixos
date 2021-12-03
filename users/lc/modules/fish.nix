{ config, lib, pkgs, inputs, ...}: {

   home.file.".config/fish/config.fish".source = ./.config/fish/config.fish;

}
