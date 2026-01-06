{ ... }:
{
  imports = [
    ../../modules/home
  ];

  # Pass platform and username parameters to modules
  _module.args = {
    platform = "nixos";
    username = "vecko";
  };
}
