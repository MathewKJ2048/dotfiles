{ config, pkgs, ... }: {

  

  programs.java.enable = true;
  programs.java.package = pkgs.openjdk25;
}