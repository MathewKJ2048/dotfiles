{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vanilla-dmz
  ];
}
