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
        debounce = 400;
        viewportBuffer.max = 500;
        viewportBuffer.min = 50;
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
      treesitter = {
        enable = true;
      };
      treesitter-context = {
        enable = true;
        lineNumbers = true;
      };
      treesitter-refactor = {
        enable = true;
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        # trace: warning: The option `plugins.cmp.extraOptions' defined in `/nix/store/x77z523b2vpdsgaj0ysx8rivwwb2200q-source/nixvim.nix' has been renamed to `plugins.cmp.settings'.
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-buffer.enable = true;
      cmp-treesitter.enable = true;
      cmp-zsh.enable = true;
      cmp-git.enable = true;
      cmp-fuzzy-buffer.enable = true;
      cmp-fuzzy-path.enable = true;
      coq-nvim = {
        enable = true;
        installArtifacts = true;
      };
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
        autoClose = false;
        disableNetrw = true;
        reloadOnBufenter = true;
        respectBufCwd = true;
        sortBy = "name";
        syncRootWithCwd = true;
        git.enable = true;
        renderer = {
          addTrailing = true;
          groupEmpty = true;
          highlightGit = true;
        };
        modified = {
          enable = true;
        };
        view = { 
          number = true;
          relativenumber = true;
        };
        openOnSetup = true;
        # hijackDirectories = {
        #   enable = true;
        # };
        hijackNetrw = true;
        hijackCursor = true;
        hijackUnnamedBufferWhenOpening = true;
        updateFocusedFile = {
          enable = true;
          updateRoot = true;
        };
      };
      mini = {
        enable = true;
        modules = {
          starter = {};
        };
      };
      comment-nvim = {
        enable = true;
      };
      dashboard = {
        enable = false;
        center = [
        ];
      };
    };
    extraConfigLua = ''
        print("what da dog doin")
    '';
  };
}
