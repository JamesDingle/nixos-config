{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nil
    nixd
    nixpkgs-fmt
  ];
}
