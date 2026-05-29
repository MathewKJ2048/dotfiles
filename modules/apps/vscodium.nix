{ config, pkgs, userConf, systemConf, ... }: {

  programs.vscodium = {
    enable = systemConf.isNixOS;
    package = pkgs.vscodium;
  };


  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/vscodium-settings.json";
      force = true;
    };
  };
}