{ config, pkgs, ... }:

{
	home.stateVersion = "24.05";
	home.packages = with pkgs; [
		ripgrep
		vim
		discord
		raycast
		spotify
		arc-browser
		iterm2
	];
	programs = {
		zsh = {
			enable = true;
			shellAliases = {
				switch = "darwin-rebuild switch --flake ~/.config/nix-darwin";
			};
		};
		vscode = {
			enable = true;
			extensions = with pkgs.vscode-extensions; [
				zhuangtongfa.material-theme
				jnoortheen.nix-ide
			];
		};
		home-manager.enable = true;
		git = {
			enable = true;
			ignores = [ "*.swp" ];
			userName = "Pete Stenger";
			userEmail = "pete@stenger.io";
			lfs = {
				enable = true;
			};
			extraConfig = {
				init.defaultBranch = "main";
				core = {
					editor = "vim";
					autocrlf = "input";
				};
				pull.rebase = true;
			};
		};
  	};
}
