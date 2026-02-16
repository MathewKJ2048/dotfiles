{ config, pkgs, username, ... }: {
  
  programs.git = {
    enable = true;
    userName = "MathewKJ";
    userEmail = "MathewKJ2048@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}