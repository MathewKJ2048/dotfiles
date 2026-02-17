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

    completionInit = '' 
        autoload -U compinit 
        compinit

        zstyle ':completion:*' menu select yes
        zstyle ':completion:*' list-colors ${"$"}{(s.:.)LS_COLORS}
        
    ''; # these need to be written explicitly, there is no boolean option to autoload compinit

    shellAliases = {
      # general
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      cls = "clear";
      history = "history 0";

      code = "codium";
      fetch = "fastfetch";
      cd = "z";

    };

    shellGlobalAliases = {
      ZSH_CUSTOM = "$HOME/.zsh_custom"; # this is to store things that should be in zsh but not in git
    };

    initContent = ''
      export PROMPT='%~▶'

      if [ -f "$HOME/.zsh_custom" ]; then
        source "$HOME/.zsh_custom"
      else
        touch "$HOME/.zsh_custom"
        echo ".zsh_custom file created"
      fi

      gitupdate()
      {
          CWD="$(pwd)"  # Current Working Directory

          if [ -z "$1" ]; then
              echo "Error: Please provide a commit message as the first argument."
              exit 1
          fi

          # -C to specify the working directory
          git -C "$CWD" add .
          git -C "$CWD" commit -m "$*" # arguments need not be in quotes
          git -C "$CWD" pull
          git -C "$CWD" push
      }


    '';
  };

}