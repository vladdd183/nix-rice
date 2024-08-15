{ config, lib, pkgs, ... }:

{
  time.timeZone = "Europe/Berlin";
  environment.systemPackages = with pkgs; [
    vim 
    git
    htop
  ];
}