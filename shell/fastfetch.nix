{ config, pkgs, lib, ... }: {

  programs.fastfetch = {
    enable = true;
    settings = {
      modules = [
        # "title"
        # "break"
        "os"
        "kernel"
        # "uptime"
        "packages"
        "shell"
        "de"
        "wm"
        "break"
        "memory"
        "swap"
        "disk"
        # "wmtheme",
        # "theme",
        # "icons",
        # "font"
        # "cursor",
        # "terminal",
        # "terminalfont",
        "break"
        "host"
        "display"
        "cpu"
        "gpu"
        "battery"
        # "poweradapter"
        
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