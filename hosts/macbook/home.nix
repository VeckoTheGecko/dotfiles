{ ... }:
{
  imports = [
    (
      { pkgs, lib, ... }:
      import ../../modules/home/home.nix {
        inherit pkgs lib;
        platform = "darwin";
        username = "Hodgs004";
      }
    )
    ../../modules/home/git.nix
    ../../modules/home/nvim.nix
    ../../modules/home/cli.nix
    ../../modules/home/starship.nix
    ../../modules/home/wezterm.nix
    ../../modules/home/obsidian.nix
  ];
}
