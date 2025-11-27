{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings.main = {
      modules-right = [
        "clock"
      ];
    };
  };
}
