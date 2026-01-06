{ lib, platform ? "nixos", ... }:
{
  imports = [
    ./home.nix
    ./git.nix
    ./nvim.nix
    ./cli.nix
  ] ++ lib.optionals (platform == "nixos") [
    ./hyprland.nix
  ];
}
