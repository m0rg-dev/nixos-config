{ config, pkgs, ... }:

{
  imports = [ ./base.nix ../profiles/osx.nix ];

  home.username = "morgan";
  home.homeDirectory = "/Users/morgan";
  home.stateVersion = "21.11";
}
