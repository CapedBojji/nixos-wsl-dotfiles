{config, pkgs, ...}:
{
    programs.eza = {
        enable = true;
        icons = true;
        enableZshIntegration = true;
        git = true;
    };
}