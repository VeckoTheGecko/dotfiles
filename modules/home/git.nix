{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      pkgs.git
      pkgs.lazygit
    ];
  };
  programs.git = {
    enable = true;
    settings = {
      user.name = "Vecko";
      user.email = "36369090+VeckoTheGecko@users.noreply.github.com";
      core.editor = "nvim";
      init.defaultBranch = "main";
      fetch.prune = true;

      alias = {
        ac = "!git add -u && git commit";
        cleanup = "!git branch --merged | grep -v '^\\*|master|develop' | xargs -n1 -r git branch -d";
        lg1 = "lg1-specific --all";
        lg2 = "lg2-specific --all";
        lg3 = "lg3-specific --all";

        lg1-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'";
        lg2-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
        lg3-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'";

        safe.directory = [ "/etc/nixos" ];
      };
    };
  };
}
