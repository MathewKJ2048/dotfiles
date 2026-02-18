{ config, pkgs, gitArgs, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = gitArgs.name;
      user.email = gitArgs.email;

      # default name of the main branch
      init.defaultBranch = "main";

      # behaviour for pull
      pull.rebase = true;
    };
  };
}