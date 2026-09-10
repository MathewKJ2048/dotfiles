{
  config,
  pkgs,
  lib,
  userConf,
  systemConf,
  ...
}:
{

  imports = [
    ./android.nix
    ./git.nix
    ./jujutsu.nix
    ./java.nix
    ./nix.nix
    ./python.nix
    ./rust.nix
    ./tex.nix
    ./web.nix
  ];

}
