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
      usernamehw.errorlens
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "html.autoCreateQuotes" = false;
      "html.autoClosingTags" = false;
      "rust-analyzer.checkOnSave" = true;
      "rust-analyzer.check.command" = "clippy";
      "editor.fontFamily" = "'Berkeley Mono', Menlo, Monaco, 'Courier New', monospace";
      "workbench.colorTheme" = "Kimbie Dark";
    };
  };
}
