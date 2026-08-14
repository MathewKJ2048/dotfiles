{ config, pkgs, lib, userConf, systemConf, ... }: {

  home.packages = with pkgs; [
    ruffle

    naev
    mindustry
    openttd
    xonotic
    supertux
    supertuxkart
    luanti
    aisleriot
    space-cadet-pinball
    wesnoth
    

  ];

# mindustry, 
# naev, 
# xonotic, 
# tuxcart, 
# supertuxbro, 
# wesnoth, 
# windows vs tux, 
# minetest/luanti etc
# openttd

# space-cadet-pinball
# aisleriot
# ruffle

}