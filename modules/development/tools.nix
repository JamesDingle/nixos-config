{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    devenv
    git
    google-cloud-sdk
  ];

}
