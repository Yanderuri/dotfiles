{config, pkgs, ... }:

{
  imports = [ 
    (builtins.fromTOML (builtins.readFile ./pastel.toml))
    ./nixvim.nix 
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vy";
  home.homeDirectory = "/Users/vy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vy/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
    targets = {
      darwin.search = "Ecosia";
    };
  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    ssh = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      # enableAutosuggestions = true;
      autosuggestion = {
        enable = true;
        highlight = "fg=#00ffff,bg=cyan,bold,underline";
      };
      defaultKeymap = "emacs";
      history = {
        expireDuplicatesFirst = true;
        save = 20000;
      };
      autocd = true;
      syntaxHighlighting = {
        enable = true;
        # styles = {
        highlighters = ["main" "brackets" "pattern" "cursor"];
        };
      shellAliases = {
        # home-config = "nvim ~/.config/home-manager/home.nix";
        lgit="lazygit";
        meh="yay";
        nixvim="nvim";
        ":q"="exit";
        vscode="code";
      };
      sessionVariables = {
      	EDITOR = "nvim";
	SUDO_EDITOR = "nvim";
        ZSHRC = "$HOME/.zshrc";
      };
      initExtraBeforeCompInit = ". /opt/homebrew/opt/asdf/libexec/asdf.sh\n";
    };
    kitty = {
      enable = false;
      font = {
        name = "MonaspiceAr Nerd Font Regular";
        size = 14;
      };
      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
      };
      shellIntegration = {
        enableZshIntegration = true;
      };
      theme = "kanagawabones";
    };
    bat = {
      enable = true;
      config.theme = "zenburn";
    };
    lazygit = {
      # https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
      enable = true;
      settings = {
        gui ={
          theme = {
              activeBorderColor = ["blue" "bold"];
          };
        };
      };
    };
    less = {
      enable = true;
    };
    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
      settings = {
        auto_sync = true;
        sync_frequency = "10m";
        search_mode = "fuzzy";
      };
    };
    btop = {
      enable = true;
      settings = {
        theme = "tomorrow-night";
        theme_background = false;
      };
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      enableTransience = true;
    };
    tealdeer = {
      enable = true;
      settings = {
        auto_update = true;
      };
    };
    eza = {
      enable = true;
      # enableAliases = true;
      enableZshIntegration = true;
      git = true;
      icons = true;
    };
    z-lua = {
      enable = true;
      enableAliases = true;
      enableZshIntegration = true;
      options = ["fzf" "enhanced"];
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    mpv = {
      enable = true;
      bindings = {
      }; # see man mpv
    };
  };  
  nix.gc = {
      automatic = true;
      frequency = "daily";
  };
}
