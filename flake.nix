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
        # ===== 1password =====
        _1password-gui
        _1password-cli
        # =====================
        wezterm
        # jetbrains-toolbox
        discord-ptb
        cloudflare-warp
        dbeaver-bin
        direnv
        obsidian
        # obs-studio
        safe-rm
        # bat
        # lsd
        flameshot
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ];

      fonts.fontconfig.enable = true;

      programs.git = {
        enable = true;
        userName = "vitran96";
        userEmail = "38664902+vitran96@users.noreply.github.com";

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
      home.file.".zshrc".source = ./zsh-zim/.zshrc;
      home.file.".zshenv".source = ./zsh-zim/.zshenv;
      home.file.".zsh_aliases".source = ./zsh-zim/.zsh_aliases;
      home.file.".zsh_hook".source = ./zsh-zim/.zsh_hook;
      home.file.".zimrc".source = ./zsh-zim/.zimrc;
      # wezterm lua file
      # spacemacs file
      # =======================================

      home.stateVersion = "24.11";
    };
  };
}

