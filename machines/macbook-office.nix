{ config, pkgs, lib, ... }:

{
  imports = [ ./base.nix ../profiles/osx.nix ];

  home.packages = [ pkgs.awscli2 pkgs.gopls pkgs.postman ];

  programs.go = {
    enable = true;
    package = pkgs.go_1_19;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      arrterian.nix-env-selector
      golang.go
    ];
  };

  globals.git_email =
    lib.removeSuffix "\n" (builtins.readFile /Users/morgan/git-email);

  home.username = "morgan";
  home.homeDirectory = "/Users/morgan";
  home.stateVersion = "21.11";
}
