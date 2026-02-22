{ config, pkgs, lib, ... }: {

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
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--color=16"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.dircolors = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ripgrep.enable = true;


}