{ config, lib, pkgs, inputs, ...}: {

   home.file.".alacritty.yml".source = ./.alacritty.yml;
   home.file.".xmobarrc".source = ./.xmobarrc;
   home.file.".xprofile".source = ./.xprofile;
   home.file.".xresources".source = ./.xresources;
   home.file."Wallpapers".source = ./Wallpapers;

   home.packages = with pkgs; [
     feh
   ];
}
