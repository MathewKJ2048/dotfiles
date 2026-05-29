{ config, pkgs, lib, userConf, ... }: {

  home.packages = with pkgs; [
    zsh-fzf-tab
  ];

  programs.zoxide.enableZshIntegration = true;
  programs.fzf.enableZshIntegration = true;
  programs.dircolors.enableZshIntegration = true;

  
  programs.zsh = 
  let
    zshConfigPath = "${config.xdg.configHome}/zsh";
    zshrcPath = "${zshConfigPath}/.zshrc";
  in
  {
    enable = true;
    dotDir = zshConfigPath;
    syntaxHighlighting.enable = true;

    plugins = [
      {
        name = pkgs.zsh-fzf-tab.name;
        src = pkgs.zsh-fzf-tab.src;
        file = "fzf-tab.plugin.zsh";
      }
    ];

    history = {
      share = true; # all zsh instances share history
      size = 10000; # number of lines
      ignoreAllDups = true; # strongest possible case - no duplicate is allowed in the file
      append = true; # concurrent zsh sessions append their history list to the file, instead of overwriting
    };

    # completionInit = '' 
    #    autoload -U compinit 
    #    compinit

        
        
        
    # ''; # these need to be written explicitly, there is no boolean option to autoload compinit

    # zstyle ':completion:*' menu select yes
    # zstyle ':completion:*' list-colors ${"$"}{(s.:.)LS_COLORS}

    shellAliases = {
      # general
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      cls = "clear";
      history = "history 0";
      ip = "ip a";
      ipconfig = "ip a";
      refresh = "source ${zshrcPath}";

      # program-specific
      fetch = lib.mkIf config.programs.fastfetch.enable "fastfetch";
      cd = lib.mkIf config.programs.zoxide.enable "z";
      grep = lib.mkIf config.programs.ripgrep.enable "rg";
      cat = lib.mkIf config.programs.bat.enable "bat -P";
    };

    shellGlobalAliases = {
      ZSH_CUSTOM = "$HOME/.zsh_custom"; # this is to store things that should be in zsh but not in git
    };

    initContent = ''

      zstyle ':completion:*' list-colors ${"$"}{(s.:.)LS_COLORS}
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:*' fzf-flags '--color=16'

      PROMPT='%~❯'

      if [ -f "$HOME/.zsh_custom" ]; then
        source "$HOME/.zsh_custom"
      else
        touch "$HOME/.zsh_custom"
        echo ".zsh_custom file created"
      fi

      gu()
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

      try()
      {
        nix-shell -p $1;
      }
      download()
      {
        yt-dlp -P ${userConf.videoDownloadDirectory} $1;
      }
      seek()
      {
        fd $1 | fzf | xargs open
      }
      music()
      {
          # fuzzyfinding and running music
          local preview_command="
          ffmpeg -ss 00:00:05 -i {} -frames:v 1 -f image2pipe -vcodec png - 2>/dev/null | chafa --clear
          "
          file=$(find ~/Music/ -type f | fzf --preview "$preview_command" --delimiter='/' --with-nth 5..)
          if [[ -n "$file" && -f "$file" ]]; then
              echo "playing: $file"
              echo "A/Z - volume up/down"
              echo "J/K/L - pitch down/reset/up"
              mpv "$file" --vo=null --loop
          fi
      }

    '';
  };

}