{ config, pkgs, ... }:

{
  # Example networking settings
  networking.networkmanager.enable = true;
  # networking.hostName = "shared-hostname"; # If you want a shared hostname across devices
}
