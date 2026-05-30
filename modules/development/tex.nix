{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # tex
    texliveFull

  ];

}
