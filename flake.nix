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
        openstack-basic = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (import ./caches.nix)
            (import ./modules/nixUnstable.nix)
            (import ./modules/openstack.nix)
            (import ./modules/packages/essentials.nix)
            (import ./users/lc)
            (import ./users/marc)
            {
              networking.hostName = "openstack-basic";
              nix.trustedUsers = [ "marc" "lc" ];
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.lc = import ./users/lc/home.nix;
              home-manager.users.marc = import ./users/marc/home.nix;
            }
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
