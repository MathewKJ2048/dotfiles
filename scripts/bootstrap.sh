echo "You're running the bootstrap script. This script is designed to turn this device into the configuration specified by "bootstrap" in flake.nix. It's assumed that dotfiles has been cloned into ~/Projects/dotfiles using git, and this script is being run by the user and not the root."


mkdir -p ~/Projects/dotfiles/temp &&
cp /etc/nixos/configuration.nix ~/Projects/dotfiles/temp/configuration.nix &&
cp /etc/nixos/hardware-configuration.nix ~/Projects/dotfiles/temp/hardware-configuration.nix &&


echo "This system's configuration has been copied into dotfiles/temp" &&

git add . &&

echo "and added to git but not committed"



echo "The system can now be built into the bootstrap configuration using nixos-rebuild switch --flake <path/to/dotfiles>/flake#bootstrap"


echo "after rebuilding, commit the changes. When making edits, edit remote and pull them. Do not make edits locally."


