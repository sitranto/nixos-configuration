{ pkgs, lib, ... }:

{    
  users.users.sitranto = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/sitranto";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    vim
    neofetch
    tree
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.power-profiles-daemon = {
    enable = true;
  };
  security.polkit.enable = true;
}
