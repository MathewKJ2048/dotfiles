{ config, pkgs, lib, userConf, systemConf, ... }: {

  imports = [
    ./browsers/firefox.nix
    ./browsers/librewolf.nix
    ./browsers/tor.nix

    ./terminals/cool-retro-term.nix
    ./terminals/ghostty.nix
    ./terminals/guake.nix
    
    ./mpv.nix
    ./qemu.nix
    ./vlc.nix
    ./vscodium.nix
  ];


  # thunderbird
  # lmms
  # sfxr
}