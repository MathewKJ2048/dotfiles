{ pkgs, userConf, isNixOS, CinnamonX11, ... }: {

  # guake needed only if cinnamon X11 and isNixOS

  home.packages = with pkgs; [
  ] ++ lib.optional (CinnamonX11 && isNixOS) guake;

}