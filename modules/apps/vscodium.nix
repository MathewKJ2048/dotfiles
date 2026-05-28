{ config, pkgs, userConf, isNixOS, ... }: {

  programs.vscodium = {
    enable = isNixOS;
    package = pkgs.vscodium;
  };


  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/vscodium-settings.json";
      force = true;
    };
  };
}