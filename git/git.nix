{ config, pkgs, userConf, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = userConf.gitArgs.name;
      user.email = userConf.gitArgs.email;

      # default name of the main branch
      init.defaultBranch = "main";

      # behaviour for pull
      pull.rebase = true;
    };
  };
}