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

    chafa

    # tools
    fzf
    zoxide

  ];


}