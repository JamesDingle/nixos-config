# ~/nixos-config/hosts/tiamat/configuration.nix
{ config, pkgs, lib, ... }:

{
  imports = [
    # Hardware configuration(s)
    ./hardware.nix
    ./gpu.nix

    # Desktop Environment
    ../../modules/desktop/kde.nix

    # system-wide modules
    ../../modules/system/user.nix
    ../../modules/system/networking.nix
    ../../modules/system/audio.nix
    ../../modules/system/virtualisation.nix

    # Program groups
    ../../modules/programs/general.nix
    ../../modules/programs/browser.nix
    ../../modules/programs/gaming.nix
    ../../modules/programs/pw.nix

    # Dev
    ../../modules/development/editors.nix
    ../../modules/development/tools.nix

    # Specific Languages (for instance I don't need TS/JS on my personal machine)
    ../../modules/development/languages/nix.nix
    ../../modules/development/languages/python.nix
    ../../modules/development/languages/zig.nix

  ];
  system.stateVersion = "25.11";

  networking.hostName = "tiamat";

  # Set your bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your timezone
  time.timeZone = "Europe/London"; # Adjust as needed

  # Configure your locale
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  # Configure console keymap
  console.keyMap = "uk";


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Auto garbage collect
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 7d";

}
