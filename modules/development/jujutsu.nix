{ userConf, ... }:
{

  # programs.git = {
  #   enable = true;
  #   settings = {
  #     user.name = userConf.gitArgs.name;
  #     user.email = userConf.gitArgs.email;

  #     # default name of the main branch
  #     init.defaultBranch = "main";

  #     # behaviour for pull
  #     pull.rebase = true;
  #   };
  # };

  programs.jujutsu = {
    enable = true;
    settings = {
      user.name = userConf.gitArgs.name;
      user.email = userConf.gitArgs.email;
    };
  };

  # this is a sample comment to test jj
  # this is also a sample comment

  programs.git.ignores = [".jj/"];
}