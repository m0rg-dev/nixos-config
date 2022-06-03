{ config, pkgs, ... }:

{
  programs.starship = { enable = true; };
  home.file.".config/starship.toml" = { source = ../configs/starship.toml; };
}
