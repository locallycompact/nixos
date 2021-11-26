{ config, lib, pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "Daniel Firth";
    userEmail = "dan.firth@homotopic.tech";
  };

  home.packages = with pkgs; [
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      coc-nvim
      dhall-vim
      idris-vim
      vim-ormolu
      vim-nix
      vim-numbertoggle
      vim-stylishask
    ];
    extraConfig = ''
      autocmd BufRead,BufNewFile /home/lc/Source/* let b:stylishask_on_save=1
      autocmd BufRead,BufNewFile /home/lc/Source/* let b:ormolu_disable=1
      set paste
      set number relativenumber
      set nu rnu
      highlight CocErrorFloat ctermfg=White
      highlight CocFloating ctermbg=DarkGray
      nnoremap <F5> :CocAction<CR>
    '';

    coc = {
      enable = true;
      settings = {
        languageserver = {
          haskell = {
            command = "haskell-language-server-wrapper";
            args = [ "--lsp" ];
            rootPatterns = [ "*.cabal" "stack.yaml" "cabal.project" "package.yaml" "hie.yaml" ];
            filetypes = [ "haskell" "lhaskell" ];
          };
        };
      };
    };
  };
}
