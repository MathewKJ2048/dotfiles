{ config, pkgs, lib, ... }: {

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        # "wmtheme",
        # "theme",
        # "icons",
        # "font"
        # "cursor",
        # "terminal",
        # "terminalfont",
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "localip"
        "battery"
        "poweradapter"
        "locale"
        "break"
        "colors"
      ];
      logo = {
        padding = {
          top = 0;          # Top padding
          left = 4;         # Left padding
          right = 4;        # Right padding
        };
      };
    };
  };

}