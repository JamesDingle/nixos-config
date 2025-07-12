{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    btop
    kitty
    wget
    htop
    obsidian
    mission-center
    git
  ];

}
