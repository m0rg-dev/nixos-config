{ config, lib, pkgs, ... }:

{
  imports = [ ../modules/vscode.nix ../modules/emacs.nix ];

  config = {
    globals.graphical = true;
    home.packages = [ pkgs.iterm2 ];
  };
}
