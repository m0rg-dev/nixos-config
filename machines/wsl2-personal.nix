{ config, pkgs, ... }:

{
  imports = [ ./base.nix ];

	globals.wsl2 = true;

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  home.stateVersion = "21.11";
	
	home.packages = [
		pkgs.util-linux
	];
}
