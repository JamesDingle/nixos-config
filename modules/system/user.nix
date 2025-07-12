  { ... }:
  {
    users.users.jad = {
      isNormalUser = true;
      description = "jad";
      extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    };
    nix.settings.trusted-users = [ "root" "jad" ];
  }
