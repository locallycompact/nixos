{ config, lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    exportConfiguration = true;
    desktopManager.gnome.enable = true;
    digimend.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = false;
      nvidiaWayland = false;
    };
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

  environment.systemPackages = with pkgs; [
    alacritty
    bitwig-studio
    brave
    exodus
    firefox
    ledger-live-desktop
    krita
    quasselClient
    obs-studio
    steam
    thunderbird
    tor-browser-bundle-bin
    wine
    xmobar
    xournal
  ];

  nixpkgs.config.allowUnfree = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  hardware.pulseaudio.enable = false;

  services.flatpak.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  sound.enable = false;

}
