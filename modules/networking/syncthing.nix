{ pkgs, lib, systemConf, ... }:
{

  # syncthing is managed from Home only if the system is not nixOS, for nixOS systems it's a system package

  home.packages = lib.optional (!systemConf.isNixOS) pkgs.syncthing;

  services.syncthing = {
    enable = !systemConf.isNixOS;
    # openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
  };

}
