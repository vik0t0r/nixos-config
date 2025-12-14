# modules/desktop/kde.nix
{ config, pkgs, ... }:

{
  # Display manager
  services.displayManager.sddm.enable = true;

  # KDE Plasma 6
  services.desktopManager.plasma6.enable = true;

  # Don't force X11; let Plasma run Wayland by default.
  # (X11 apps still run via XWayland automatically.)
  services.xserver.enable = false;

  services.displayManager.defaultSession = "plasma";

  # Optional but commonly useful on Wayland (screen sharing, etc.)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    pkgs.kdePackages.xdg-desktop-portal-kde
  ];
}
