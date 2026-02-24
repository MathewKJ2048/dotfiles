{
  name = "mathew";
  fullName = "Mathew Kuthur James";
  email = "mathewkj2048@gmail.com"; 

  system = "x86_64-linux";

  locale = "en_US.UTF-8";
  timezone = "America/New_York";
  
  dotFilesDirectory = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
  homeDirectory = "/home/${username}";
  downloadsDirectory = "${homeDirectory}/Downloads"; 
  desktopDirectory = "${homeDirectory}/Desktop";

  screenshotsDirecory = desktopDirectory; # location to which screenshots are saved
  videoDownloadDirectory = desktopDirectory; # locations to which downloaded videos are saved
  
  gitArgs  = {
    inherits email; # email for git, used for signing commits
    name = fullName; # name for git, used for signing commits
  };

};