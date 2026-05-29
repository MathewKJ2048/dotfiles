{ config, pkgs, userConf, systemConf, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional systemConf.isNixOS mpv;
  

  home.file =
    builtins.mapAttrs
      (key: value: {
        # symlink ${userConf.thisDirectory}/apps/${value} -> {key}
        source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/${value}";
        force = true;
      })
      {
        "${config.xdg.configHome}/mpv/input.conf" = "mpv-input.conf";
        "${config.xdg.configHome}/mpv/mpv.conf" = "mpv.conf";
      };
  
  
}