{
  pkgs,
  userConf,
  systemConf,
  ...
}:
{

  # guake needed only if cinnamon X11 and isNixOS

  home.packages =
    with pkgs;
    [
    ]
    ++ lib.optional systemConf.isNixOS guake;

}
