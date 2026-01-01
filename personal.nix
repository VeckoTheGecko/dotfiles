{ lib, pkgs, ... }: let
  username = "vecko";
  in {
    home = {
      packages = with pkgs; [ # mainly focussing on CLI tooling etc
        pkgs.git
        pkgs.zsh
        pkgs.wezterm
        pkgs.kanata-with-cmd
        pkgs.starship
        pkgs.uv
        pkgs.pixi
        
        pkgs.neovim
        pkgs.ripgrep
        pkgs.lazygit
        pkgs.fnm # node version manager
        pkgs.python312
        pkgs.unzip
        pkgs.kanata
        pkgs.tree
        pkgs.xclip
        pkgs.claude-code
        pkgs.home-manager
        pkgs.gnumake42
      ];
      inherit username;
      homeDirectory = "/home/${username}";

      # You do not need to change this if you're reading this in the future.
      # Don't ever change this after the first build.  Don't ask questions.
      stateVersion = "25.11";
    };
    programs.git = {
      enable = true;
      settings = {
        user.name = "Vecko";
        user.email = "36369090+VeckoTheGecko@users.noreply.github.com";

        init.defaultBranch = "main";
      
        alias = {
          ac = "!git add -u && git commit";
          cleanup = "!git branch --merged | grep -v '^\\*|master|develop' | xargs -n1 -r git branch -d";
          lg1 = "lg1-specific --all";
          lg2 = "lg2-specific --all";
          lg3 = "lg3-specific --all";

          lg1-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
          lg2-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
          lg3-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'";
        
        safe.directory = ["/etc/nixos"];
        };
      };
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
      };
    };
  }
