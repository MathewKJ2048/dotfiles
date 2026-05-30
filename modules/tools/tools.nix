{ pkgs, ... }:
{

  home.packages = with pkgs; [

    curl
    wget
    imagemagick
    ffmpeg
    yt-dlp
    zip
    unzip
  ];

}
