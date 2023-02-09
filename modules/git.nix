{ config, lib, pkgs, ... }:

{
  options.globals = {
    git_signing_key = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    };
  };

  config.home.file.".ssh/allowed_signers".text =
    "* ${builtins.readFile config.globals.git_signing_key}";

  config.programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      pull = { rebase = true; };
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = config.globals.git_signing_key;
    };
    userName = "Morgan Wolfe";
    userEmail = config.globals.git_email;
  };
}
