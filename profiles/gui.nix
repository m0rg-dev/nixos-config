{ config, pkgs, ... }:

{
  config = {
    globals.graphical = true;
    home.packages = [ pkgs.discord pkgs.iosevka ];
  };
}