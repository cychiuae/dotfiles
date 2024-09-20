{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ../p10k-config;
        file = "p10k.zsh";
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "gitfast"
      ];
    };

    initExtra = ''
      export LANG=en_US.UTF-8

      export PATH="/usr/local/sbin:$PATH"
      export PATH="$HOME/.flutter/bin:$PATH"
      export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
      export USE_GKE_GCLOUD_AUTH_PLUGIN=True

      DISABLE_AUTO_TITLE="true"

      # $(brew --prefix asdf)/libexec/asdf.sh
      # . /usr/local/opt/asdf/libexec/asdf.sh

      # tmux
      export TERM=screen-256color
      eval "$(direnv hook zsh)"

      # brew
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };
}
