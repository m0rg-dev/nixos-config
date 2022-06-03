{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
        company
        diminish
        docker-compose-mode
        dockerfile-mode
        flycheck
        go-mode
        helm
        lsp-mode
        lsp-treemacs
        lsp-ui
        magit
        markdown-mode
        nix-mode
        projectile
        rust-mode
        terraform-mode
        treemacs
        treemacs-projectile
        yasnippet
    ];
    package = if config.globals.graphical then pkgs.emacs else pkgs.emacs-nox;
  };

  home.file.".emacs" = { text = (builtins.readFile ../configs/init.el ); };
}
