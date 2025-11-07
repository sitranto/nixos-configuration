{ config, lib, pkgs, ... }:

let
  user = "sitranto";
in
{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "nomodeset" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "${user}-machine";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  nixpkgs.config.allowUnfree = true;

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  users.users.sitranto = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    home = "/home/${user}";
  };

  home-manager.users.${user} = ./modules/home/home.nix;

  environment.systemPackages = with pkgs; [
    git
    wget
    bspwm
    sxhkd
    alacritty
    vim
  ];

  system.stateVersion = "25.05"; 

}

