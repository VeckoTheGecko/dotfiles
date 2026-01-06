{ pkgs, lib, platform ? "nixos", username, ... }:
let
  homeDirectory = if platform == "darwin" then "/Users/${username}" else "/home/${username}";
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
    inherit homeDirectory;

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };

}
