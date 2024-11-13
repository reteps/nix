{ config, pkgs, ... }:

{
	home.stateVersion = "24.05";
	home.packages = with pkgs; [
		ripgrep
		hello
		kitty
		vim
		discord
		raycast
		spotify
		arc-browser
		# pkgs.bitwarden-desktop
	];
	programs.zsh = {
		enable = true;
		shellAliases = {
			switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
		};
	};
	programs.vscode = {
		enable = true;
		extensions = with pkgs.vscode-extensions; [
			zhuangtongfa.material-theme
			jnoortheen.nix-ide
		];
	};
	programs.home-manager.enable = true;

}
