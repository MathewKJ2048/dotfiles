{ config, pkgs, userConf, isNixOS, ... }: {

  programs.ghostty.enable = isNixOS;
  
  home.file = {
    "${config.xdg.configHome}/ghostty/config" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/ghostty/config";
      force = true;
    };
  };
}