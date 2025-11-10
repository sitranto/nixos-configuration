{ pkgs, lib, ... }:
let
  username = "sitranto";
in
{    
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/${username}";
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
}
