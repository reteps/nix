{ config, pkgs, ... }:
let
	system = "aarch64-darwin";
in {
      imports = [
            ./dock
      ];
	environment.systemPackages =
	[
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
	nixpkgs.config.allowUnfree = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";
	system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;
      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
	users.users.retep = {
		name = "retep";
		home = "/Users/retep";
	};
      local = {
            dock.enable = true;
            dock.entries = [
                  { path = "/Applications/Safari.app/"; }
                  { path = "${pkgs.vscode}/Applications/Visual Studio Code.app/"; }
            ];
      };
}
