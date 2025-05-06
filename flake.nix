{
  description = "My dotfiles + Home Manager config";

  outputs = { self, ... }: {
    homeConfigurations.vi-tran = { pkgs, ... }: {
      home.username = "vi-tran";
      home.homeDirectory = "/home/vi-tran";

      home.packages = with pkgs; [ 
        godot 
	gh 
      ];

      programs.git = {
        enable = true;
        userName = "vitran96";
        userEmail = "38664902+vitran96@users.noreply.github.com";
      };

      # Symlink dotfiles (assuming they're in this repo)
      home.file.".config/nvim".source = ./nvim;
      #home.file.".bashrc".source = ./bashrc;

      home.stateVersion = "24.11";
    };
  };
}

