{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.wezterm 
    pkgs.nerd-fonts.fira-code
  ];

}
