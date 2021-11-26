{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    desktopManager.gnome.enable = true;
    digimend.enable = true;
    displayManager.gdm.enable = true;
    layout = "us,fr,de";
    videoDrivers = [ "nvidia" ];
    wacom.enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu i3status i3lock i3blocks ];
    };
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
    xkbOptions = "eurosign:e, compose:ralt, grp:alt_space_toggle";
  };

  environment.systemPackages = with pkgs; [ xmobar ];

  nixpkgs.config.allowUnfree = true;

  hardware.opengl = { enable = true; driSupport32Bit = true; };

  services.flatpak.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.pulseaudio.enable = false;
  sound.enable = false;

}
