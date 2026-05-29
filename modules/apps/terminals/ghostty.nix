{ config, userConf, systemConf, ... }: {

  programs.ghostty.enable = systemConf.isNixOS;
  
  home.file = {
    "${config.xdg.configHome}/ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/ghostty-config";
      force = true;
    };
  };
}