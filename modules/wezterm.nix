{ config, pkgs, lib, ... }:

{
	home.packages = lib.mkIf config.globals.graphical ( [ pkgs.wezterm ] );

	home.file.".wezterm.lua" = {
		source = ../configs/wezterm.lua;
		onChange = lib.mkIf config.globals.wsl2 ''
			cp ~/.wezterm.lua $(readlink ~/.wezterm-target)
		'';
	};
}
