{ pkgs, userConf, isNixOS, ... }: {

  # guake needed only if cinnamon X11 and isNixOS

  home.packages = with pkgs; [
  ] ++ lib.optional (userConf.CinnamonX11 && isNixOS) guake;

}