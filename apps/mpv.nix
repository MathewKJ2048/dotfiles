{ config, pkgs, userConf, isNixOS, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional isNixOS mpv;
  
  home.file = {
    "${config.xdg.configHome}/mpv/input.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/apps/mpv-input.conf";
      force = true;
    };

    "${config.xdg.configHome}/mpv/mpv.conf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/apps/mpv.conf";
      force = true;
    };

  };
  
}