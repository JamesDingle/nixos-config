{ pkgs, ... }:
{
  users.users.jad = {
    isNormalUser = true;
    description = "jad";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
  };
  nix.settings.trusted-users = [
    "root"
    "jad"
  ];

  # Define a systemd service that runs as this user
  systemd.user.services.add-ssh-key = {
    description = "Add custom SSH key to the agent";

    # This service should start as part of the user's default session
    wantedBy = [ "default.target" ];

    # It must run after the ssh-agent has started
    after = [ "ssh-agent.service" ];
    requires = [ "ssh-agent.service" ];

    # The script to execute
    script = ''
      # The %h specifier is replaced by the user's home directory
      # The full path to ssh-add is used for robustness
      ${pkgs.openssh}/bin/ssh-add %h/.ssh/jad_workstation
    '';

    # Service configuration
    serviceConfig = {
      # This service runs once and then exits
      Type = "oneshot";
      # Keep the service active in systemd's view even after the script exits
      RemainAfterExit = true;
    };
  };
}
