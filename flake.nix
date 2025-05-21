{
  description = "My dotfiles + Home Manager config";

  outputs = { self, ... }: {
    homeConfigurations.vi-tran = { pkgs, ... }: {
      home.username = "vi-tran";
      home.homeDirectory = "/home/vi-tran";

      home.packages = with pkgs; [ 
        gh
        aseprite
        # godot_4
        love
        vscode
        emacs
        # ===== 1password =====
        _1password-gui
        _1password-cli
        # =====================
        wezterm
        # jetbrains-toolbox
        discord-ptb
        # `warp-svc` & `warp-cli register` to start (https://discourse.nixos.org/t/cant-start-cloudflare-warp-cli/23267)
        cloudflare-warp
        dbeaver-bin
        obsidian
        # === CLI enhancements ===
        direnv
        safe-rm
        bat
        lsd
        ripgrep
        # ========================
        # obs-studio
        flameshot
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      fonts.fontconfig.enable = true;

      programs.git = {
        enable = true;
        userName = "vitran96";
        userEmail = "38664902+vitran96@users.noreply.github.com";

        # DEPRECATED
        extraConfig = ''
          [credential "https://github.com"]
            helper = "!gh auth git-credential"
          [credential "https://gist.github.com"]
            helper = "!gh auth git-credential"
          [filter "lfs"]
            clean = "git-lfs clean -- %f"
            smudge = "git-lfs smudge --skip -- %f"
            process = "git-lfs filter-process"
            required = true
          [commit]
            gpgSign = true
        '';
      };

      # NOTE: for some reason, [steam, nano] cannot be configured with home-manager

      # ===========Symlink dotfiles============
      # Assuming they're in this repo
      # Symlink files are READ-ONLY
      #
      home.file.".config/nvim".source = ./nvim;
      home.file.".config/flameshot/flameshot.ini".source = ./flameshot/flameshot.ini;
      home.file.".config/wezterm".source = ./wezterm;
      home.file.".spacemacs".source = ./.spacemacs;
      # home.file.".config/fcitx5".source = ./fcitx5;
      home.file.".zshrc".source = ./zsh-zim/.zshrc;
      home.file.".zshenv".source = ./zsh-zim/.zshenv;
      home.file.".zsh_aliases".source = ./zsh-zim/.zsh_aliases;
      home.file.".zsh_hook".source = ./zsh-zim/.zsh_hook;
      home.file.".zimrc".source = ./zsh-zim/.zimrc;
      # =======================================

      # Clone spacemacs
      home.file.".emacs.d" = {
        # don't make the directory read only so that impure melpa can still happen
        # for now
        recursive = true;
        source = pkgs.fetchFromGitHub {
          owner = "syl20bnr";
          repo = "spacemacs";
          rev = "491e17ba9cdcb253a3292a3049abb8767c91b9bb";
          sha256 = "DEKvlFi2927oGfaxnhCWd7AYU0TD8yyaWg4I+Fx+8V0=";
        };
      };

      # NOTE: avoid running nvim
      # else ~/.local/share/nvim/site/autoload/ will be created with unwanted own & mod

      # NOTE: config keybind for Gnome
      # https://discourse.nixos.org/t/nixos-options-to-configure-gnome-keyboard-shortcuts/7275/15

      home.stateVersion = "24.11";
    };
  };
}

