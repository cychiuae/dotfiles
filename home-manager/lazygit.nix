{ config, pkgs, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      keybinding = {
        universal = {
          appendNewline = "<tab>";
        };
      };
    };
  };
}
