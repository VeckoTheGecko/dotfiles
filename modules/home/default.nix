{ lib, platform ? "nixos", ... }:
{
  imports = [
    ./home.nix
    ./git.nix
    ./nvim.nix
    ./cli.nix
    ./starship.nix
    ./wezterm.nix
  ] ++ lib.optionals (platform == "nixos") [
    ./hyprland.nix
  ];
}
