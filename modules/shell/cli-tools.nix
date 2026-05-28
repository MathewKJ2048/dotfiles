{ pkgs, ... }: {

  home.packages = with pkgs; [
    cmatrix # matrix characters
    cava # music visualizer
    cowsay # cow say
    chafa # image viewer ascii
    cbonsai # ascii bonsai
    sl # steam locomotive
    btop # better htop
    figlet # ascii text art
    asciinema # record the terminal
    asciinema-agg # to convert to gifs
    fd # better find, written in rust
  ];

  programs.ripgrep.enable = true; # better grep, written in rust
  programs.bat.enable = true; # better cat, written in rust
  programs.zoxide.enable = true;  # better cd, written in rust
  programs.dircolors.enable = true; # used to get LS_COLORS

  programs.fzf = { # fuzzy-finding
    enable = true;
    defaultOptions = [
      "--color=16"
    ];
  };

  

  


}