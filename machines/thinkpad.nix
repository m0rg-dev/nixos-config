{ config, pkgs, ... }:

{
  imports = [ ./base.nix ../profiles/gui.nix ];

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  home.stateVersion = "21.11";

  home.file.".emacs".text = "(defvar font-height 100)";
}
