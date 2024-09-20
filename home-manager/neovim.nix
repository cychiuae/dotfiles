{ config, pkgs, lib, ... }:

let
  mason-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason.nvim";
      rev = "b3c82a23b26818e18e20036452bdcf7821ddc37d";
      sha256 = "sha256-+3ppOoOVpguK6ghE3KByGnY2j5GpaxGmOGwmTBT3bfE=";
    };
    buildPhase = ''
      echo "Skip build phase"
    '';
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-lspconfig.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "90a8bbf106b85b76951a34c542058ffa807de2b1";
      sha256 = "sha256-jUbk77uefolxJI9EaoAlxkq5tstStf4JCh0xCc9IlT8=";
    };
    buildPhase = ''
      echo "Skip build phase"
    '';
  };
  customNodePackages = pkgs.callPackage ./nodePackages { };
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
      # formatter
      nixpkgs-fmt

      # tree sitter
      tree-sitter

      # lsp

      # c# dotnet
      omnisharp-roslyn

      # golang
      gopls

      # python
      pyright

      #nix
      nil
      # js/ts
      nodePackages.typescript
      nodePackages.typescript-language-server
    ] ++ [
      # tailwindcss
      customNodePackages."@tailwindcss/language-server"
    ];

    plugins = with pkgs.vimPlugins; [
      # Match bracket
      nvim-autopairs
      nvim-ts-autotag

      # Quick comment out code
      vim-commentary

      # some colors
      nvim-colorizer-lua

      # cmp
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      cmp_luasnip
      luasnip
      cmp-vsnip
      vim-vsnip
      lspkind-nvim

      # Pretty input
      dressing-nvim

      # Pretty ui
      noice-nvim
      nui-nvim

      #formatter
      formatter-nvim

      # git
      gitsigns-nvim
      lazygit-nvim

      # indentation
      indent-blankline-nvim

      # lint
      nvim-lint

      # lsp
      nvim-code-action-menu
      nvim-lspconfig

      # telescope
      plenary-nvim
      telescope-nvim

      # tree
      nvim-tree-lua
      nvim-web-devicons

      # treesitter
      nvim-treesitter

      # theme
      bufferline-nvim
      lualine-nvim
      tokyonight-nvim
    ] ++ [
      # manage lsp
      mason-nvim
      mason-lspconfig-nvim
    ];
  };
}
