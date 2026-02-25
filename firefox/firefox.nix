{ config, pkgs, userConf, isNixOS, ... }: {
  {
  programs.firefox = {
      enable = isNixOS;
      profiles.default = {
          settings = {

              "browser.aboutConfig.showWarning" = false;

              "devtools.toolbox.host" = "left"; # dock devtools to left

              "browser.startup.page" = 1; # set startup homepage to home
              "browser.startup.homepage" = "about:home";

              "browser.newtabpage.enabled" = false;
              "browser.newtab.preload" = false;

              "browser.newtabpage.activity-stream.telemetry" = false;
              "browser.newtabpage.activity-stream.feeds.telemetry" = false;

              "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
              "browser.newtabpage.activity-stream.feeds.topsites" = false;
              "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;

              "browser.newtabpage.activity-stream.showWeather" = false;

              "browser.aboutwelcome.enabled" = false; # prevents showing welcome on re-installs

          };
      };
  };
}
  
}