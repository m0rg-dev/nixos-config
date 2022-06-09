{ config, pkgs, ... }:

{
  imports = [ ./base.nix ];

  home.username = "morgan";
  home.homeDirectory = "/Users/morgan";
  home.stateVersion = "21.11";
}
