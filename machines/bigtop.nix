{ config, pkgs, ... }:

{
  imports = [ ./base.nix ../profiles/gui.nix ];

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  home.stateVersion = "22.11";
}
