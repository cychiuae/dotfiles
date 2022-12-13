{ config, pkgs, lib, ... }:

{
  xdg.configFile."nvim/settings.lua".source = lib.cleanSource ../nvim/settings.lua;
  xdg.configFile."nvim/lua".source = lib.cleanSource ../nvim/lua;

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile ~/.config/nvim/settings.lua
    '';

    plugins = with pkgs.vimPlugins; [
      # lsp
      nvim-lspconfig
    ];
  };
}
