{ config, pkgs, ... }:

let
    configDir = if pkgs.stdenv.isDarwin then
        "Library/Application Support/nushell"
    else
        "${config.xdg.configHome}/nushell";
in {
    programs.nushell = {
        enable = true;
    };

    home.file."${configDir}/config.nu".source = ../configs/nu_config.nu;
    home.file."${configDir}/env.nu".source = ../configs/nu_env.nu;
}