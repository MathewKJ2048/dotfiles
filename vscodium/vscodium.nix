{ config, pkgs, userConf, ... }: {
  
  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/vscodium/settings.json";
      force = true;
    };
  };
}