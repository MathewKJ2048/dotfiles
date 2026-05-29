
{ pkgs, userConf, systemConf, ... }:

{

  services.openssh = {
    enable = true;
    ports = [ 42 ];
    settings = {
      PasswordAuthentication = systemConf.sshPasswordAuth;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}