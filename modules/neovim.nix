{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    viAlias = true;
    vimAlias = true;
    enable = true;
    extraConfig = builtins.readFile ../configs/init.vim;
    extraPackages = [ pkgs.ripgrep ];
    plugins = with pkgs.vimPlugins; [
      vim-airline-themes
      airline
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp-vsnip
			ctrlp-vim
      fugitive
      lsp-status-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      plenary-nvim
      popup-nvim
      rust-tools-nvim
      vim-addon-nix
      vim-colors-solarized
      vim-vsnip
    ];
  };
}
