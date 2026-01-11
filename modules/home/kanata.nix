{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kanata # Keyboard remap layouts.
  ];
  home.file.".config/kanata/kanata.kbd".source = ./../../config/kanata.kbd;
}
