{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    cabal-install
    curl
    haskell-language-server
    ghc
    git
    nixpkgs-fmt
    stack
    vim
    wget
  ];

}
