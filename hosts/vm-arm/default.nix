{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/hyprland.nix
      ./hardware-configuration.nix
      ./bootloader.nix
    ];

  networking.hostName = "vm-arm";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  system.stateVersion = "25.05"; 

}

