{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    firefox
    xonsh
  ];

  programs.xonsh = {
    enable = true;
  };
}
