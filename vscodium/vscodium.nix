{ config, pkgs, ... }: {
  
  home.file = {
    "${config.xdg.configHome}/VSCodium/User/settings.json" = {
      source = config.lib.file.mkOutOfStoreSymLink "${dotFilesPath}/vscodium/settings.json";
      force = true;
    }
  }
}