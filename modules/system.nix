{ pkgs, lib, ... }:
let
  username = "sitranto";
in
{
  programs.fish.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ];
    home = "/home/${username}";
    shell = pkgs.fish;
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
