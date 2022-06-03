{ config, pkgs, ... }:

{
  home.packages = [ pkgs.discord pkgs.iosevka ];
  programs.emacs.package = pkgs.emacs;
}
