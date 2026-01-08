{
  pkgs,
  lib,
  platform ? "nixos",
  username,
  ...
}:
let
  homeDirectory = if platform == "darwin" then "/Users/${username}" else "/home/${username}";
in
{
  nix = lib.mkIf (platform == "darwin") {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  home = {
    packages = with pkgs; [
      pkgs.home-manager
      pkgs.gnumake42
      pkgs.zoxide

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
