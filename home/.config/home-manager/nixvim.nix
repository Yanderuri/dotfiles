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
        action = "<cmd>NvimTreeToggle<CR>";
        options.silent = true;
      }
      {
        mode = ["n" "t"];
        key = "<leader>t";
        action = "<cmd>ToggleTerm<CR>";
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
      todo-comments = {
        enable = true;
      };
      noice = {
        enable = true;
      };
      # transparent = {
      #  enable = true;
      # };
      notify.enable = true;
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
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };
      lsp-lines = {
        enable = true;
      };
      lspkind = {
        enable = true;
      };
      lspsaga = {
        enable = true;
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
      telescope = {
        enable = false;
      };
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
     /*  illuminate = {
        enable = true;
      }; */
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
    };
    extraConfigLua = ''
        print("what da dog doin")
    '';
  };
}
