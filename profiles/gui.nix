{ config, pkgs, ... }:

{
  config = {
    globals.graphical = true;
    home.packages =
      [ pkgs.discord pkgs.firefox pkgs.iosevka pkgs.gnome3.gnome-tweaks ];
  };
}
