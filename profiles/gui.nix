{ config, pkgs, ... }:

{
  imports = [ ../modules/vscode.nix ];

  config = {
    globals.graphical = true;
    home.packages = [ pkgs.alacritty pkgs.discord ];
  };
}
