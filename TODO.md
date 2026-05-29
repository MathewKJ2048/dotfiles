# Todo

- extract out all configuration options and pass one for standalone and one for nixos


## KDE:

- wallpaper switch, icon switch, etc

- DMZ-white cursor


## Cinnamon:


## Common:

- VSCodium
- Firefox
- thunderbird
- web-apps
- ruffle
- ghostty

## Custom scripts:
- calendar
- todo

## Misc:

- Qemu/KVM
- organize hosts
- set up ssh-server




## High-level

- save dconf dumps
- konsave

- imagemagick for wallpapers
- icon recoloring
- auto-install personal scripts


```
	userConf = rec {
        name = "mathew";
        fullName = "Mathew Kuthur James";
        email = "mathewkj2048@gmail.com"; 

        username = name;
        homeDirectory = "/home/${username}";
        downloadsDirectory = "${homeDirectory}/Downloads"; 
        desktopDirectory = "${homeDirectory}/Desktop";
        thisDirectory = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
        screenshotsDirectory = desktopDirectory; # location to which screenshots are saved
        videoDownloadDirectory = desktopDirectory; # locations to which downloaded videos are saved
        
        gitArgs  = {
          inherit email; # email for git, used for signing commits
          name = fullName; # name for git, used for signing commits
        };
      };


	systemConf = {
		isNixOS = true;
		KdeWayland = false;
		CinnamonX11 = false;
	};

```
