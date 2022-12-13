{ config, pkgs, lib, ... }:
let
  vscode-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "vscode.nvim";
    src = pkgs.fetchFromGitHub {
        owner = "Mofiqul";
        repo = "vscode.nvim";
        rev = "dabd5454e88d9ac9f91a5c2f9f6b347410e31162";
        sha256 = "sha256-08+N892xOvbFEk/yAZLZHcR+ixdVTOeY83xO3wf/Oqc=";
    };
  };
in
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

    extraPackages = with pkgs; [
      # lsp
      rnix-lsp
    ];

    plugins = with pkgs.vimPlugins; [
      # lsp
      nvim-lspconfig

      # tree
      nvim-tree-lua
      nvim-web-devicons

      # treesitter
      nvim-treesitter

      # theme
      {
        plugin = vscode-nvim;
      }
    ];
  };
}
