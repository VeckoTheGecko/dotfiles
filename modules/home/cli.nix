{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pkgs.wezterm
      pkgs.gh
    ];
  };

}
