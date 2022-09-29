{ config, lib, pkgs, ... }:

{
    imports = [
        ../modules/vscode.nix
    ];

    config = {
        home.packages = [
            pkgs.iterm2
        ];
    };
}
