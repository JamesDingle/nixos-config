{
  description = "JAD Nix Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # Make Home Manager use the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Optional: nixos-hardware for common hardware configurations
    # nixos-hardware.url = "github:NixOS/nixos-hardware";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    {

      nixosConfigurations = {
        tiamat = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux"; # Or aarch64-linux, etc.
          modules = [
            # main system configuration for this host
            ./hosts/tiamat/configuration.nix

            # Optional: Import nixos-hardware specific to your machine
            # inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-carbon-gen9 # Example

            # Home Manager configuration for this host's user(s)
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jad = import ./home/users/jad.nix;
            }
          ];
        };
      };

      homeConfigurations = {
        "jad@tiamat" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Or aarch64-linux
          modules = [
            ./home/users/jad.nix
          ];
        };
      };
    };
}
