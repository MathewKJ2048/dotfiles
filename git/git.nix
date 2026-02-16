{ config, pkgs, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "Mathew Kuthur James";
      user.email = "MathewKJ2048@gmail.com";

      # default name of the main branch
      init.defaultBranch = "main";

      # behaviour for pull
      pull.rebase = true;
    };
  };
}