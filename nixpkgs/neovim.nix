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

      # lua
      sumneko-lua-language-server
      # nix
      rnix-lsp
      # ts
      nodePackages.eslint_d
      nodePackages.prettier_d_slim
      nodePackages.typescript
      nodePackages.typescript-language-server
    ];

    plugins = with pkgs.vimPlugins; [
      # Match bracket
      nvim-ts-autotag

      # cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp-vsnip
      vim-vsnip

      # indentation
      indent-blankline-nvim

      # lsp
      nvim-lspconfig
      null-ls-nvim

      # telescope
      plenary-nvim
      telescope-nvim

      # tree
      nvim-tree-lua
      nvim-web-devicons

      # treesitter
      nvim-treesitter

      # theme
      lualine-nvim
      tokyonight-nvim
      {
        plugin = vscode-nvim;
      }
    ];
  };
}
