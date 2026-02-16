{ config, pkgs, ... }: {
  
  # decorations

  home.packages = with pkgs; [

    # decorations
    cmatrix
    cava
    cbonsai
    sl
    btop
    fastfetch

    # image viewer
    chafa

    # tools
    fzf
    zoxide
  ];


}