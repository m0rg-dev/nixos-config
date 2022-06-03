{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  imports = [
      ../modules/starship.nix
      ../modules/emacs.nix
  ];

  home.packages =
    [ pkgs.neofetch pkgs.rustup pkgs.ncurses pkgs.openssh pkgs.nixfmt ];

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
}
