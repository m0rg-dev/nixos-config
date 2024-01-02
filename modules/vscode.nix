{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      dbaeumer.vscode-eslint
      hashicorp.terraform
      mkhl.direnv
      ms-python.isort
      ms-python.python
      ms-vscode-remote.remote-ssh
      rust-lang.rust-analyzer
      stkb.rewrap
      tamasfe.even-better-toml
      usernamehw.errorlens
    ];
    userSettings = {
      "editor.cursorStyle" = "underline";
      "editor.fontFamily" =
        "'Fixedsys Excelsior', Menlo, Monaco, 'Courier New', monospace";
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "editor.lineHeight" = 1.0;
      "editor.minimap.enabled" = false;
      "editor.renderLineHighlight" = "gutter";
      "editor.tabSize" = 2;
      "extensions.autoCheckUpdates" = false;
      "extensions.ignoreRecommendations" = true;
      "html.autoClosingTags" = false;
      "html.autoCreateQuotes" = false;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.checkOnSave" = true;
      "update.mode" = "none";
      "workbench.colorTheme" = "Monokai Dimmed";
    };
  };
}
