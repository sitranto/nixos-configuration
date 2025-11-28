{ config, pkgs, ... }:
let
  username = "sitranto";
in
{
  imports = [
    ./programs/neovim.nix
    ./programs/waybar.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";

    packages = with pkgs; [
      pavucontrol
      zip
      obsidian
      nodePackages.npm
      docker-compose
      vivaldi
      rofi
      alacritty
      telegram-desktop
      vesktop
      wl-clipboard
      grim
      slurp
      steam
    ];
  };

  programs.home-manager.enable = true;
}
