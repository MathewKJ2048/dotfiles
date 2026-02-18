{ config, pkgs, gitEmail, gitName, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = gitName;
      user.email = gitEmail;

      # default name of the main branch
      init.defaultBranch = "main";

      # behaviour for pull
      pull.rebase = true;
    };
  };
}