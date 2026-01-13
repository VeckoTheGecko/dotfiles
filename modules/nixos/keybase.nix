{
  pkgs,
  ...
}:
{
  services.keybase.enable = true;
  users.users.vecko.packages = with pkgs; [
    pkgs.keybase-gui
    pkgs.gnupg
  ];
  environment.systemPackages = with pkgs; [
    pinentry-curses
  ];
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
