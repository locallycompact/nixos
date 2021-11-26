{ inputs, ... }: {
  imports = [ "${inputs.nixpkgs}/nixos/modules/virtualisation/openstack-config.nix" ];
} 
