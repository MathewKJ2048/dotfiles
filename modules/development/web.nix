{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # web development
    nodejs
    deno
  ];

}
