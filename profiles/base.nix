{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/starship.nix
    ../modules/emacs.nix
    ../modules/tmux.nix
    ../modules/rust.nix
    ../modules/neovim.nix
  ];

  options.globals = {
    graphical = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    git_email = lib.mkOption {
      type = lib.types.str;
      default = "corp@m0rg.dev";
    };
  };

  config = {
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.packages = [
      pkgs.daemonize
      pkgs.direnv
      pkgs.kubectl
      pkgs.lorri
      pkgs.htop
      pkgs.ncurses
      pkgs.neofetch
      pkgs.nixfmt
      pkgs.openssh
    ];

    programs.git = {
      enable = true;
      extraConfig = { pull = { rebase = true; }; };
      userName = "Morgan Wolfe";
      userEmail = config.globals.git_email;
    };

    programs.gh = { enable = true; };

    programs.zsh = {
      enable = true;
      enableSyntaxHighlighting = true;
      defaultKeymap = "emacs";
      initExtra = ''
        export DIRENV_LOG_FORMAT=
        eval "$(direnv hook zsh)"
        daemonize $HOME/.nix-profile/bin/lorri daemon
      '';
      oh-my-zsh = { enable = true; };
    };
  };
}
