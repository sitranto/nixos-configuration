{ config, pkgs, ... }:
let
  username = "sitranto";
in
{
  imports = [
    ./programs/neovim.nix
  ];

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
      neovim
      telegram-desktop
      fish
      discord
      vesktop
    ];
  };

  programs.home-manager.enable = true;
}
