{ config, pkgs, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "Mathew Kuthur James";
      user.email = "MathewKJ2048@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}