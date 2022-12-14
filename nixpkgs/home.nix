{ config, pkgs, ... }:

let
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];
in
{
  inherit imports;

  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "yinyinchiu";
    homeDirectory = "/Users/yinyinchiu";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
  };

  home.packages = with pkgs; [
    fd
    google-cloud-sdk
    gnupg
    jq
    kubectl
    kubectx
    node2nix # An useful package for installing node packages
    reattach-to-user-namespace # cp & paste in tmux to clipboard
    ripgrep
    skim
    tmux
    xh
    yarn
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # direnv
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };
}
