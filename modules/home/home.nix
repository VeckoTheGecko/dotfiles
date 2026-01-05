{ lib, pkgs, ... }:
let
  username = "vecko";
in
{
  home = {
    packages = with pkgs; [
      pkgs.home-manager
      pkgs.gnumake42

      # python
      pkgs.uv
      pkgs.pixi

      # Extras
      pkgs.claude-code
    ];
    inherit username;
    homeDirectory = "/home/${username}";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };

}
