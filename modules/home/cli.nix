{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pkgs.wezterm

    ];
  };

}
