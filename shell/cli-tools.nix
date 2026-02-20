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


}