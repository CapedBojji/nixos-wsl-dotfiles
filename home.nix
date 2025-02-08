{ config, pkgs, user, nixvim, stylix, ... } :

{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  home.stateVersion = "24.05";

  imports = [
    ./modules
    # nixvim.homeManagerModules.nixvim
    # stylix.homeManagerModules.stylix
  ];

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    # Dev tools
    vim
    wget
    curl
    gh # GitHub CLI
    jq # JSON processor
    yq # YAML processor
    httpie
    delta
    lazygit
    alejandra # Nix formatter
    home-manager
    nil # Nix LSP
    just # Command runner (like make but simpler)
    difftastic # Better diff tool
    shellcheck # Shell script analyzer
    nodePackages.prettier # Code formatter
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "NerdFontsSymbolsOnly" "Noto" ]; })
    
    # System tools
    btop
    ripgrep
    fd
    tree
    duf
    ncdu
    bottom
    du-dust
    procs
    sd
    choose

    # Shell tools
    fzf
    bat
    eza
    zoxide

    # Utils
    tldr
    neofetch
    p7zip
    unzip
    zip

    # Python development tools
    uv
    ruff
    nh
    vivid

    # Add these useful tools
    comma  # Run programs without installing them
    nix-output-monitor  # Better nix-build output
    nixpkgs-review  # Review nixpkgs pull requests
    statix  # Lint and suggest improvements for Nix code
    
    # Optional but recommended
    devenv  # Development environments
    direnv  # Per-directory environment variables

    # Add these packages for ephemeral package support
    nix-index  # Required for , (comma) to work
    comma

  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "CapedBaldy";  # TODO: Change this
    userEmail = "capedbaldy141@gmail.com";  # TODO: Change this
    delta.enable = true;
    lfs.enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      core.autocrlf = "input"; # For WSL
       diff.colorMoved = "default";
      merge.conflictStyle = "diff3";
      rebase.autoStash = true;
    };
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
    };
  };


  # Basic bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      # Add your aliases here
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Use Catppuccin theme (Mocha variant)
      palette = "catppuccin_mocha";

      # Theme color definitions
      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      # Modern symbol styling
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      # Disable some modules that might slow down the prompt
      aws.disabled = true;
      gcloud.disabled = true;
      kubernetes.disabled = true;

      # Directory configuration
      directory = {
        truncation_length = 5;
        truncate_to_repo = true;
      };

      # Git configuration
      git_branch = {
        symbol = "🌱 ";
        truncation_length = 20;
        truncation_symbol = "...";
      };

      git_status = {
        conflicted = "🏳";
        ahead = "🏎💨";
        behind = "😰";
        diverged = "😵";
        up_to_date = "✓";
        untracked = "🤷";
        stashed = "📦";
        modified = "📝";
        staged = "[++\\($count\\)](green)";
        renamed = "👅";
        deleted = "🗑";
      };

      # Nix shell configuration
      nix_shell = {
        symbol = "❄️ ";
        format = "via [$symbol$state( \($name\))]($style) ";
      };
    };
  };


  # Add this section for better XDG compliance
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
  };

  # Add nix-index configuration
  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;  # Since you're using zsh
  };
}
