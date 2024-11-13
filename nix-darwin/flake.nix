{
  description = "nix-darwin system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macmini
	services = {
	  radarr = { enable = true; };
	};
    darwinConfigurations."macmini" = nix-darwin.lib.darwinSystem {
      system.configurationRevision = self.rev or self.dirtyRev or null;

      modules = [
	./configuration.nix
	home-manager.darwinModules.home-manager
	{
		home-manager.useGlobalPkgs = true;
		home-manager.useUserPackages = true;
		home-manager.users.retep = import ./home.nix;
		home-manager.sharedModules = [
		];
	}
	];
    };
  };
}
