{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/hyprland.nix
      ../../modules/sound.nix
      ../../modules/zapret.nix
      ./hardware-configuration.nix
      ./bootloader.nix
      ./nvidia.nix
    ];

  networking.hostName = "sitranto-machine";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  system.stateVersion = "25.05"; 

}

