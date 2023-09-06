{ config, pkgs, ... }:

{
  imports = [ ./base.nix ../profiles/osx.nix ];

  globals.git_signing_key = "${config.home.homeDirectory}/.ssh/id_rsa.pub";

  programs.vscode.userSettings."window.zoomLevel" = -1;

  home.username = "morgan";
  home.homeDirectory = "/Users/morgan";
  home.stateVersion = "21.11";
}
