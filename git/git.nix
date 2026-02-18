{ config, pkgs, emailAddress, ... }: {
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII";
      user.email = "hhhhhh";

      # default name of the main branch
      init.defaultBranch = "main";

      # behaviour for pull
      pull.rebase = true;
    };
  };
}