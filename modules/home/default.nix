{ lib, pkgs, ... }:
{
  imports = [
    ./home.nix
    ./git.nix
    ./nvim.nix
    ./cli.nix
  ];
}
