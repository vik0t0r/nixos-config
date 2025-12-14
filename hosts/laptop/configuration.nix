{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  networking.hostName = "laptop";

  # Networking (host-level is fine too, but can be common if all machines use NM)
  networking.networkmanager.enable = true;

  # Bootloader (host-specific)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Desktop environment (keep here if laptop-only; move to common if all hosts use GNOME)
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  system.stateVersion = "25.11";
}