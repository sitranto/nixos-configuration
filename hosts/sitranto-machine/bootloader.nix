{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelParams = [ "nomodeset" "quiet" "splash" "loglevel=3" ];

  boot.initrd = {
    compressor = "zstd";
    compressorArgs = [ "-1" ]; 
    
    systemd.enable = true;
  };

  boot.extraModulePackages = [ ];
}
