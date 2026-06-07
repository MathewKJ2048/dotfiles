# Todo

- syncthing - make it global
- make remmina work
- fill out instructions
- tailscale secret auto-setup
- github secret auto-setup
- make ssh-ing easier
- get rid of rustdesk
- make qemu work
- games and apps
- enable config toggling for packages
- flutter: ability to build app, turn into a flake
- python uv
- nix ld
- nix fhs
- turn personal tools into a flake
- icon recoloring
- devenv - look into it


## Common:

- Firefox
- thunderbird
- web-apps
- ruffle
- ghostty

## Custom scripts:
- calendar
- todo


- icon recoloring


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

```
## Set-up

- Run `./setup.sh` to make the build folder and set up settings for vscodium

## Non-NixOS:

1) install the `nix` package manager. This involves running a shell script. Single-user mode is recommended.
2) enable flakes and nix-commands by writing this to the config file. For single user installs, the config file is in `~/.config/nix/nix.conf`. It may need to be created first.

```
experimental-features = nix-command flakes
```
The file is `./nix-home-manager/nix.conf` if needed

3) To bootstrap home-manager, run:

```
nix-shell -p home-manager
home-manager switch --flake ./nix-home-manager
```

4) To update flake.nix, run

```
nix flake update --flake ./nix-home-manager
```

5) To rebuild software, run

```
home-manager switch --flake ./nix-home-manager
```

6) To collect garbage, run:

```
nix-env --delete-generations old
nix-store gc
```

## NixOS:

1) Edit configuration.nix in `/etc/nixos/configuration.nix` to install git and enable nix-commands and flakes. Use `sudo nano`.

2) git clone this repo and check the configuration in flake.nix

3) 

```