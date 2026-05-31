# dotfiles

A personal repository containing commonly used configs, to replicate my systems quickly

This repository uses the nix package manager with flakes, and home-manager, to manage packages and their configs. Download the package manager here: 




## NixOS

1) Install NixOS locally on the system.

2) Install git:

```
sudo nano /etc/nixos/configuration.nix
# add git to the packages
sudo nixos-rebuild switch
```

3) Clone this repository into the `Projects` folder by running:

```
cd ~/Projects
git clone https://github.com/MathewKJ2048/dotfiles
```

4) Enable all the scripts and run the needed setup scripts:

```
chmod +x *   # makes scripts runnable, use with caution
./scripts/setup-folders.sh
./scripts/setup-codium.sh
```

5) Make a temporary entry for this host:

```
mkdir ./hosts/temp
cp /etc/nixos/configuration.nix ./hosts/temp/configuration.nix
cp /etc/nixos/hardware-configuration.nix ./hosts/temp/hardware-configuration.nix
git add .
```
6) Make a minimal system by running:

```
sudo nixos-rebuild switch --flake ./flake#bootstrap
```

7) Decide on a hostname `HN`. Rename `temp` to `HN` and edit `./hosts/HN/configuration.nix`. Rebuild by running:

```
sudo nixos-rebuild switch --flake ./flake#bootstrap
hostnamectl --static   # should return HN
```

8) Make an entry for `HN` in flake.nix. Ensure that all imports point to the correct location. For further rebuilds, run:

```
./scripts/rebuild-nixos.sh
```

9) To access secrets, run: 

```
./scripts/decrypt.sh
```

10) To set up the machine, follow the structure of the existing hosts. 



## Generic linux:

1) Ensure the nix package manager is installed: [https://nixos.org/download/](https://nixos.org/download/)

2) Fill this up



