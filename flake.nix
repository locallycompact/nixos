{
  description = "Homotopic.Tech NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    haskellNix.url = "github:input-output-hk/haskell.nix";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        aiur = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (import ./hardware/aiur.nix)
            (import ./caches.nix)
            (import ./modules/nixUnstable.nix)
            (import ./modules/packages/essentials.nix)
            (import ./users/lc)
            (import ./modules/desktop.nix)
            {
              boot.loader.systemd-boot.enable = true;
              boot.loader.efi.canTouchEfiVariables = true;
              networking.hostName = "aiur";
              networking.useDHCP = false;
              networking.interfaces.enp5s0.useDHCP = true;
              networking.interfaces.wlp3s0.useDHCP = true;
              networking.interfaces.wlp4s0.useDHCP = true;
              nix.trustedUsers = [ "lc" ];
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.lc = import ./users/lc/home.nix;
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
