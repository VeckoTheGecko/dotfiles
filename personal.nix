{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
    ];
    username = "vecko";
    homeDirectory = "/home/vecko";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "25.11";
  };
}
