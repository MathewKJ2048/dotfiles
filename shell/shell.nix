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

  programs.dircolors.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    syntaxHighlighting.enable = true;

    history = {
      share = true; # all zsh instances share history
      size = 10000; # number of lines
      ignoreAllDups = true; # strongest possible case - no duplicate is allowed in the file
      append = true; # concurrent zsh sessions append their history list to the file, instead of overwriting
    };

    shellAliases = {
      # general
      ll = "ls -l";
      la = "ls -a";
      cls = "clear";
      history = "history 0";

      code = "codium";
      fetch = "fastfetch";
      cd = "z";

    };

    initContent = ''
      export PROMPT='%~▶'
    '';
  };

}