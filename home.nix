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
