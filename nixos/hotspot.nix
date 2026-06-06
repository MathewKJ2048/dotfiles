
{ systemConf, ... }:

{

 services.create_ap = {
    enable = true;
    settings = {
      INTERNET_IFACE = "eth0";
      WIFI_IFACE = "wlan0";
      SSID = systemConf.hotspotSSID;
      PASSPHRASE = systemConf.hotspotPASSPHRASE;
    };
  };
}