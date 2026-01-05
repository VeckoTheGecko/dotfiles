{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pkgs.neovim
      pkgs.ripgrep
      pkgs.fnm # node version manager
      pkgs.python312
      pkgs.unzip
      #pkgs.kanata # broken for some reason
      pkgs.kanata-with-cmd
      pkgs.tree
      pkgs.xclip

    ];
  };

}
