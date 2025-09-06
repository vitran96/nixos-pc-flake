{
  description = "My dotfiles + Home Manager config";

  outputs = { self, ... }: {
    homeConfigurations.vi-tran = { pkgs, ... }: {
      home.username = "vi-tran";
      home.homeDirectory = "/home/vi-tran";

      # NOTE: consider GNU stow or chezmoi for dotfiles management
      home.packages = with pkgs; [ 
        gh
        aseprite
        tiled
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
        # eza
        ripgrep
        btop
        htop
        zoxide
        fzf
        ranger # file manager
        # yazu # file manager
        fd # find alternative
        tree
        # tokei # code counter
        du-dust # du alternative
        dua # du alternative
        # gitui
        # nushell
        # ========================
        libreoffice
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

      # NOTE: config keybind for Gnome
      # https://discourse.nixos.org/t/nixos-options-to-configure-gnome-keyboard-shortcuts/7275/15

      home.stateVersion = "24.11";
    };
  };
}

