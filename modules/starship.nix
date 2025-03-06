
{config, pkgs, ...}: 
{
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
}