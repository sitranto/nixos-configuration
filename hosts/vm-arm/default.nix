{ config, lib, pkgs, ... }:

{
  imports =
    [
      ../../modules/system.nix
      ../../modules/bspwm.nix
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vm-arm";
  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  system.stateVersion = "25.05"; 

}

