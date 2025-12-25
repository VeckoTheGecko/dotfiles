.PHONY: update
update:
	home-manager switch --flake .#personal

.PHONY: clean
clean:
	nix-collect-garbage -d
