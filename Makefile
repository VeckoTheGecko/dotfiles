.PHONY: update
update:
	home-manager switch --flake .#vecko

.PHONY: clean
clean:
	nix-collect-garbage -d
