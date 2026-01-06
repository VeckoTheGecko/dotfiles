{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = ''
        🦎$directory$git_branch$git_commit$git_state$git_status$time$character'';

      git_branch = {
        format = " [$symbol$branch(:$remote_branch)]($style)";
      };
    };
  };
}
