{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zed-editor
    vscode
    vim
  ];
}
