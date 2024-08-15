 
{ config, pkgs, lib, ... }:

{
  imports = [
    ../modules/system/common.nix
    ../modules/system/users.nix
    ../modules/hardware/bluetooth.nix
    ../modules/applications/browsers.nix
    ../modules/applications/shells.nix
  ];

  networking.hostName = "desktop";
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma5.enable = true;
}
