{ config, pkgs, userConf, isNixOS, ... }: {

  programs.vscode = {
    enable = isNixOS;
    package = pkgs.vscodium;
  };
  
  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userConf.thisDirectory}/vscodium/settings.json";
      force = true;
    };
  };
}