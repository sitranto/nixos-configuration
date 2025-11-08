{ pkgs, ...  }:

{
  services.xserver.enable = false;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland";
  };

  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
