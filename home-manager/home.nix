{ config, pkgs, ... }:

let
  imports = [
    ./git.nix
    ./lazygit.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];

  gcloudPkgs = pkgs.google-cloud-sdk.withExtraComponents [
    pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
  ];

  config.allowUnfree = true;
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
    stateVersion = "23.05";
  };



  home.packages = with pkgs; [
    asdf-vm
    blackbox
    dua # disk usage util
    fd
    gcloudPkgs
    gnupg
    jq
    kubectl
    kubectx
    kubernetes-helm
    lazygit # git tui
    nerdfonts
    node2nix # An useful package for installing node packages
    nodejs
    openssh
    pinentry
    pinentry_mac
    python311
    reattach-to-user-namespace # cp & paste in tmux to clipboard
    ripgrep
    skim
    spotify-tui
    tmux
    watch
    xh
    yarn
  ];

  fonts.fontconfig = {
    enable = true;
  };

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
