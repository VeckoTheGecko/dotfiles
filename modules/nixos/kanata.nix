{
  lib,
  pkgs,
  config,
  ...
}:
{
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        config = builtins.readFile ./../../config/kanata.kbd;
      };
    };
  };

}
