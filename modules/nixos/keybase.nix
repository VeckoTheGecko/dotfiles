{
  pkgs,
  ...
}:
{
  services.kanata.enable = true;
  users.users.vecko.packages = with pkgs; [
    pkgs.keybase-gui
  ];
}
