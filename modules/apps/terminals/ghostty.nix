{ config, userConf, isNixOS, ... }: {

  programs.ghostty.enable = isNixOS;
  
  home.file = {
    "${config.xdg.configHome}/ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/ghostty-config";
      force = true;
    };
  };
}