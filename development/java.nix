{ config, pkgs, ... }: {

  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };

}