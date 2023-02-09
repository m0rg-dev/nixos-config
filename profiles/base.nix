{ config, lib, pkgs, ... }:

{
  imports = [ ../modules/git.nix ../modules/starship.nix ../modules/rust.nix ];

  options.globals = {
    graphical = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    git_email = lib.mkOption {
      type = lib.types.str;
      default = "corp@m0rg.dev";
    };
    wsl2 = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home.packages = [
      pkgs.awscli2
      pkgs.bat
      pkgs.btop
      pkgs.daemonize
      pkgs.direnv
      pkgs.file
      pkgs.gnupg
      pkgs.kubectl
      pkgs.libarchive # for bsdtar
      pkgs.lorri
      pkgs.htop
      pkgs.jq
      pkgs.ncurses
      pkgs.neofetch
      pkgs.nix-index
      pkgs.nixfmt
      pkgs.onefetch
      pkgs.openssh
      pkgs.ripgrep
      pkgs.tokei
    ];

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
