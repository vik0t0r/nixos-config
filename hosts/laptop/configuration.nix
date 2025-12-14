{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/desktop/kde.nix
  ];

  networking.hostName = "laptop";

  # Networking (host-level is fine too, but can be common if all machines use NM)
  networking.networkmanager.enable = true;

  # Bootloader (host-specific)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}