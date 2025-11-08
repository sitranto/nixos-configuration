{ config, pkgs, ... }:
let
  username = "sitranto";
in
{
  imports = [];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

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
      neovim
      telegram-desktop
    ];
  };

  programs.home-manager.enable = true;
}
