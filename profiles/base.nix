{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/starship.nix
    ../modules/emacs.nix
    ../modules/tmux.nix
    ../modules/rust.nix
    ../modules/neovim.nix
  ];

  options.globals = {
    graphical = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.packages = [ pkgs.neofetch pkgs.ncurses pkgs.openssh pkgs.nixfmt ];

    programs.git = {
      enable = true;
      userName = "Morgan Wolfe";
      userEmail = "corp@m0rg.dev";
    };

    programs.gh = { enable = true; };

    programs.zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      defaultKeymap = "emacs";
      oh-my-zsh = { enable = true; };
    };
  };
}
