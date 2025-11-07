{ config, pkgs, ... }:

{
  imports = [];

  home = {
    username = "sitranto";
    homeDirectory = "/home/sitranto";

    stateVersion = "25.05";

    packages = with pkgs; [
      zip
      obsidian
      nodejs
      nodePackages.npm
      docker-compose
      vivaldi
      rofi
      alacritty
      sxhkd
    ];
  };

  programs.home-manager.enable = true;
}
