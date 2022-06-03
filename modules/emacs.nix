{ config, pkgs, ... }:

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
    package = pkgs.emacs-nox;
  };

  home.file.".emacs" = { source = ../configs/init.el; };
}
