{ config, pkgs, ... }:

{
  imports = [ ./base.nix ];

  home.username = "morgan";
  home.homeDirectory = "/home/morgan";
  home.stateVersion = "21.11";

	home.packages = [
		pkgs.awscli2
		pkgs.gopls
	];

	programs.git = {
		extraConfig = {
			commit = {
				gpgsign = false;
			};
		};
	};

	programs.go = {
		enable = true;
		package = pkgs.go_1_18;
	};

	programs.zsh.envExtra = ''
		# TODO: why?
		export CARGO_NET_GIT_FETCH_WITH_CLI=true

		export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
	'';
}
