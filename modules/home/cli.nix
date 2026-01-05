{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pkgs.wezterm
      pkgs.starship

    ];
  };

}
