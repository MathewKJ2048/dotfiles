
{ systemConf, ... }:

{

 services.create_ap = {
    enable = true;
    settings = {
      # run `ip link show` to get this info for the specific device
      INTERNET_IFACE = systemConf.hotspot.INTERNET_IFACE;
      WIFI_IFACE = systemConf.hotspot.WIFI_IFACE;
      SSID = systemConf.hotspot.SSID;
      PASSPHRASE = systemConf.hotspot.PASSPHRASE;
    };
  };
}