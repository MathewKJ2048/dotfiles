{ config, pkgs, userConf, isNixOS, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional isNixOS mpv;
  

  home.file =
    builtins.mapAttrs
      (key: value: {
        # symlink ${userConf.thisDirectory}/apps/${value} -> {key}
        source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/apps/${value}";
        force = true;
      })
      {
        "${config.xdg.configHome}/mpv/input.conf" = "mpv-input.conf";
        "${config.xdg.configHome}/mpv/mpv.conf" = "mpv.conf";
      };
  
  
}