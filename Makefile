.PHONY: update
update:
	home-manager switch --flake .#personal

.PHONY: clean
clean:
	nix-collect-garbage -d

.PHONY: format
format:
	nix-shell -p nixfmt-tree --command treefmt