# dotfiles
A personal repository containing commonly used configs, to replicate my systems quickly


This repository uses the nix package manager with flakes, and home-manager, to manage packages and their configs.

## Set-up

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