{
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    colorschemes = {
      kanagawa = {
        enable = true;
          background = {
            dark = "dragon";
            light = "lotus";
          };
        dimInactive = true;
      };
    };
    options = {
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      cursorline = true;
      spell = false;
      shiftwidth = 2;
    };
    keymaps = [
      {
        mode = "n";
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = "<leader>n";
        action = ":NvimTreeToggle<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>t";
        action = ":ToggleTerm<CR>";
        options.silent = true;
      }
    ];
    globals = {
      mapleader = ",";
    };
    plugins = {
      nix.enable = true;
      lualine = {
        enable = true;
        globalstatus = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        refresh = {
          statusline = 750;
          tabline = 750;
          winbar = 750;
        };
      };
      toggleterm = {
          enable = true;
          autochdir = true;
          direction = "float";
      };
      which-key = {
          enable = true;
      };
      bufferline = {
          enable = true;
          hover = {
            enabled = true;
            delay = 250;
        };
      };
      multicursors = {
        enable = true;
      };
      indent-blankline = {
        enable = true;
      };
      noice = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          cmake.enable = true;
          lua-ls.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          bashls.enable = true;
          java-language-server.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
      };
      cmp-nvim-lsp.enable = true;
      lint = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
      illuminate = {
        enable = true;
      };
      telescope = {
        enable = true;
      };
      nvim-tree = {
        enable = true;
      };
      comment-nvim = {
        enable = true;
      };
    };
    extraConfigLua = ''
        print("what da dog doin")
    '';
  };
}
