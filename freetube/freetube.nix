{ config, pkgs, userConf, isNixOS, ... }: {

  programs.freetube.enable = isNixOS;
  
  home.file = {
    "${config.xdg.configHome}/FreeTube/settings.db" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/freetube/settings.db";
      force = true;
    };
  };
}