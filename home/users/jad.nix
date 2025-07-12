# ~/nixos-config/home/users/jad.nix
{ config, pkgs, ... }:

{
  home.username = "jad";
  home.homeDirectory = "/home/jad";

  # Define packages specific to the user
  # home.packages = with pkgs; [
  #   firefox
  #   git
  #   htop
  # ];

  # Manage dotfiles directly with Home Manager
  # home.file.".config/nvim/init.vim".source = ../../dotfiles/nvim/init.vim;

  # Enable zsh and configure it
  programs.zsh = {
    enable = true;
    # shellAliases = {
    #   ll = "ls -l";
    # };
  };

  # Example: Configure git
  programs.git = {
    enable = true;
    userName = "James Dingle";
    userEmail = "your.email@example.com";
  };

  # Example: Configure vim/neovim
  # programs.vim.enable = true;
  programs.neovim.enable = true;

  # You can also import other home-manager modules if you have more complex setups
  # imports = [
  #   ./modules/shared-shell-config.nix
  # ];

  # Set your home-manager version
  home.stateVersion = "25.11"; # IMPORTANT: Set this to your NixOS version
}
