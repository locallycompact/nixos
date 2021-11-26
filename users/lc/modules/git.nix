{ config, lib, pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "Daniel Firth";
    userEmail = "dan.firth@homotopic.tech";
  };

}
