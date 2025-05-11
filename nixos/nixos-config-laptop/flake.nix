{
  description = "NixOS + Home Manager setup with dotfiles flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles.url = "github:vitran96/.dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... }: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/myhost.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          # Use the full Home Manager config from your dotfiles flake
          home-manager.users.vi-tran = dotfiles.homeConfigurations.vi-tran;
        }
      ];
    };
  };
}

