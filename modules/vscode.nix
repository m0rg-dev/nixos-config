{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      bbenoist.nix
      hashicorp.terraform
      rust-lang.rust-analyzer
      stkb.rewrap
      tamasfe.even-better-toml
    ];
  };
}
