{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "YinYin Chiu";
    userEmail = "cychiuae@connect.ust.hk";

    signing = {
      key = "40228CC36DA57438";
      signByDefault = true;
    };

    aliases = {
      lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
      fixup = "!git log -n 50 --pretty=format:'%h %s' --no-merges | sk | cut -c -7 | xargs -o git commit --fixup";
      switch-branch = "!git branch | sk | xargs -o git switch";
    };

    ignores = [
      ".DS_Store"
    ];

    extraConfig = {
      core = {
        editor = "nvim";
      };

      commit = {
        verbose = true;
      };

      rebase = {
        autosquash = true;
      };

      "diff \"blackbox\"" = {
        textconv = "gpg --use-agent -q --batch --decrypt";
      };
    };
  };
}
