{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # 1-index is more ergonomic with my normal keyboard - keeps it all on the left hand
    baseIndex = 1;

    prefix = "C-q";
  };

  home.file.".tmux.conf" = { source = ../configs/tmux.conf; };
}
