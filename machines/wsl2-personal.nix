{ config, pkgs, ... }:

{
  imports = [ ./base.nix ];

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  home.stateVersion = "21.11";
}
