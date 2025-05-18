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
      ];

      programs.git = {
        enable = true;
        userName = "vitran96";
        userEmail = "38664902+vitran96@users.noreply.github.com";

        extraConfig = ''
          [credential "https://github.com"]
            helper = "!gh auth git-credential"
          [credential "https://gist.github.com"]
            helper = "!gh auth git-credential"
        '';
      };

      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };

      # programs.nano.enable = false;

      # ===========Symlink dotfiles============
      # Assuming they're in this repo
      # Symlink files are READ-ONLY
      #
      # home.file.".config/nvim".source = ./nvim;
      # home.file.".bashrc".source = ./bashrc;
      # =======================================

      home.stateVersion = "24.11";
    };
  };
}

