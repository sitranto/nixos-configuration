{pkgs, ...}:


{
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+bspwm";
      lightdm.enable = true;
    };

    windowManager = {
      bspwm.enable = true;
    };
  };
}
