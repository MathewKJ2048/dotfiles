echo "You're running the bootstrap script. This script is designed to turn this device into the configuration specified by "bootstrap" in flake.nix. It's assumed that dotfiles has been cloned into ~/Projects/dotfiles using git."

if (( EUID != 0 )); then
    echo "This script needs sudo privileges. Please run as root or with sudo."
    exit 1
fi

mkdir -p ~/Projects/dotfiles/temp &&
cp /etc/nixos/configuration.nix ~/Projects/dotfiles/temp/configuration.nix &&
cp /etc/nixos/hardware-configuration.nix ~/Projects/dotfiles/temp/configuration.nix &&
git add

echo "This system's configuration has been copied into dotfiles/temp and added to git. The system will now build into the bootstrap configuration."

nixos-rebuild switch --flake ~/Projects/dotfiles/flake#bootstrap &&
git commit -m "dummy commit"

echo "This system has now been bootstrapped. The changes have committed. Local edits cannot be pushed to remote. To make edits, push to remote from a machine with access, then run git pull"