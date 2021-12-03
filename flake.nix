{
  description = "Homotopic.Tech NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    haskellNix.url = "github:input-output-hk/haskell.nix";
    haskellNix.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    emanote.url = "github:srid/emanote";
    emanote.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        aiur = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (import ./caches.nix)
            (import ./hardware/aiur.nix)
            (import ./modules/nixUnstable.nix)
            (import ./modules/packages/essentials.nix)
            (import ./modules/ledger.nix)
            (import ./modules/emanote.nix)
            (import ./users/lc)
            {
               environment.systemPackages = [inputs.emanote.outputs.defaultPackage.x86_64-linux];
            }
            (import ./modules/desktop.nix)
            {
              boot.loader = {
                systemd-boot.enable = true;
                efi.canTouchEfiVariables = true;
              };
              networking = {
                hostName = "aiur";
                useDHCP = false;
                interfaces = {
                  enp5s0.useDHCP = true;
                  wlp3s0.useDHCP = true;
                  wlp4s0.useDHCP = true;
                };
                firewall.enable = false;
              };
              nix.trustedUsers = [ "lc" ];
            }
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.lc = import ./users/lc/home.nix;
              };
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
