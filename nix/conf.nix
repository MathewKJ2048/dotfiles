rec {
  name = "mathew";
  fullName = "Mathew Kuthur James";
  email = "mathewkj2048@gmail.com"; 

  system = "x86_64-linux";
  hostName = "nixos"; # networking hostname

  KdeWayland = true; # this is when building for KDE on wayland
  CinnamonX11 = true; # this is when building for Cinnamon on X11

  locale = "en_US.UTF-8";
  timeZone = "America/New_York";
  keyboardLayout = "us";
  
  username = name;
  homeDirectory = "/home/${username}";
  downloadsDirectory = "${homeDirectory}/Downloads"; 
  desktopDirectory = "${homeDirectory}/Desktop";
  thisDirectory = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
  screenshotsDirecory = desktopDirectory; # location to which screenshots are saved
  videoDownloadDirectory = desktopDirectory; # locations to which downloaded videos are saved
  
  gitArgs  = {
    inherit email; # email for git, used for signing commits
    name = fullName; # name for git, used for signing commits
  };

}