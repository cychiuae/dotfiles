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
      rev = "e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526";
      sha256 = "sha256-BHUw/LUVxfw5XWjW5EYMAyTmnRpuvt+duoOkHjJO878=";
    };
    buildPhase = ''
      echo "Skip build phase"
    '';
  };
  mason-null-ls-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-null-ls.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jay-babu";
      repo = "mason-null-ls.nvim";
      rev = "0fcc40394b8d0f525a8be587268cbfac3e70a5bc";
      sha256 = "sha256-gUnG3kCNHc7aTOR5844zQwdNsDhi0uuVHT/n36NGXJg=";
    };
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

      # golang
      gopls
      # nix
      rnix-lsp
      # python
      python310Packages."jedi-language-server"
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
      cmp-vsnip
      vim-vsnip
      lspkind-nvim

      # git
      gitsigns-nvim
      lazygit-nvim

      # indentation
      indent-blankline-nvim

      # lsp
      nvim-code-action-menu
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
      bufferline-nvim
      lualine-nvim
      tokyonight-nvim
    ] ++ [
      # manage lsp
      mason-nvim
      mason-lspconfig-nvim
      mason-null-ls-nvim

      # theme
      vscode-nvim
    ];
  };
}
