{ config, pkgs, userArgs, ... }: {
  
  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymlink "${userArgs.dotFilesPath}/vscodium/settings.json";
      force = true;
    };
  };
}