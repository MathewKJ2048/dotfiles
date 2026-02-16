{ config, pkgs, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "MathewKJ";
      user.email = "MathewKJ2048@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}