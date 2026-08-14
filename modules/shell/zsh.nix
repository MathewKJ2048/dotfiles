{ config, pkgs, lib, systemConf, userConf, ... }: {

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


    shellAliases = {
      # general
      ls = "ls --color=auto";
      ll = "ls -l";
      la = "ls -a";
      cls = "clear";
      history = "history 0";
      refresh = "source ${zshrcPath}";

      # program-specific
      fetch = lib.mkIf config.programs.fastfetch.enable "fastfetch";
      cd = lib.mkIf config.programs.zoxide.enable "z";
      grep = lib.mkIf config.programs.ripgrep.enable "rg";
      cat = lib.mkIf config.programs.bat.enable "bat -P";
      # code = lib.mkIf config.programs.vscodium.enable "codium";
      # the above is wrong because config.programs.vscodium.enable is false when codium not installed via nix but via other package managers, codium is considered the default over code so there is no checking with mkIF
      code = "codium";
    };

    shellGlobalAliases = {
      ZSH_CUSTOM = "$HOME/.zsh_custom"; # this is to store things that should be in zsh but not in git
    };

    initContent = ''

      zstyle ':completion:*' list-colors ${"$"}{(s.:.)LS_COLORS}
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:*' fzf-flags '--color=16'

      if [[ -n "$SSH_CONNECTION" ]]; then
        # Prompt for remote SSH sessions
        PROMPT='%F{green}%n%f@%F{green}%m%f:%F{blue}%~%f❯'
      else
        # Prompt for local sessions
        PROMPT='%F{blue}%~%f❯'
      fi

      

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
      wallpaper()
      {
          # fuzzyfinding and switching wallpapers
          file=$(find ${userConf.thisDirectory}/wallpapers/ -type f | fzf --preview 'chafa {}' --delimiter='/' --with-nth 6..)
          if [[ -n "$file" && -f "$file" ]]; then
              cp $file ${userConf.thisDirectory}/build/base;
              cp $file ${userConf.thisDirectory}/build/modified;
              gsettings set org.cinnamon.desktop.background picture-uri  "file://${userConf.thisDirectory}/build/modified"
          fi
      }
      ${  if systemConf.isNixOS then ''
      rebuild()
      {
        echo "rebuilding nixos for $(hostnamectl --static)"
        sudo nixos-rebuild switch --flake ${userConf.thisDirectory}/flake#$(hostnamectl --static)
      }
      '' else ''
      rebuild-home()
      {
        echo "rebuilding home for $(hostnamectl --static)"
        home-manager switch --flake ${userConf.thisDirectory}/flake#$(hostnamectl --static)
      }
      ''  }
      flake-update()
      {
        echo "updating flake in ${userConf.thisDirectory}/flake"
        echo "run rebuild after this to get new packages"
        nix flake update --flake ${userConf.thisDirectory}/flake
      }
    '';
  };

}