{
  pkgs,
  lib,
  config,
  platform ? "nixos",
  username,
  ...
}:
let
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/nixos/nixpkgs/tarball/3377aca4caa3c533a417702bc478286dc3ac0058";
    sha256 = "sha256:0yxxjwiq6gcvwif3nm0hvil7m10vj3zfbvl4pi1wbp8ir431kc34";
  }) { system = pkgs.stdenv.hostPlatform.system; };
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
      gnumake42
      zoxide

      # python
      unstable.uv
      unstable.ty
      unstable.pixi

      # Extras
      claude-code
    ];

    inherit username;
    inherit homeDirectory;

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };

}
