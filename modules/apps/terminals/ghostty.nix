{
  config,
  userConf,
  systemConf,
  ...
}:
{

  programs.ghostty.enable = systemConf.isNixOS;

  home.file = {
    "${config.xdg.configHome}/ghostty/config.ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/config/config.ghostty";
      force = true;
    };
  };
}
