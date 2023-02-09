{ config, lib, pkgs, ... }:

{
  imports = [ ../modules/vscode.nix ];

  config = {
    globals.graphical = true;
    home.packages = [ pkgs.iterm2 ];
  };
}
