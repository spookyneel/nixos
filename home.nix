{ config, pkgs, ... }:

{
  home.username = "neel";
  home.homeDirectory = "/home/neel";
  home.stateVersion = "26.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use NixOS";
      nrs = "sudo nixos-rebuild switch -I nixos-config=/home/neel/nixos/configuration.nix";
    };

    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
  };

  home.packages = with pkgs; [
    bat
  ];
}


