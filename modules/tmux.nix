{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    # 1-index is more ergonomic with my normal keyboard - keeps it all on the left hand
    baseIndex = 1;
    escapeTime = 300;
    terminal = "screen-256color";
    prefix = "C-q";
  };

  home.file.".tmux.conf" = { source = ../configs/tmux.conf; };
}
