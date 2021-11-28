{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    cabal-install
    curl
    dhall
    ipfs
    haskell-language-server
    ghc
    git
    nodejs
    nixpkgs-fmt
    stack
    vim
    wget
  ];

}
