# dotfiles

My dotfiles - using Nix for package management (for *nix systems), but also contains
NixOS configuration files.

## Getting started

### 1. Clone down and cd in

```
git clone ... ~/dotfiles
cd ~/dotfiles
```

### 2. Install

If on Mac:
- install nix

If on NixOS:
- Symlink OS config into right place `sudo ln -s ~/dotfiles/nixos /etc/nixos`
- `sudo nixos rebuild switch`

Install packages and dotfiles:

```
nix run home-manager/release-25.11 --switch .#personal
```

This will run home manager in an isolated environment, which will be used to install
the rest of the packages and dotfiles on the system. The resulting installation will
have home manager available.

### 3. ...
```
home-manager switch --flake .#personal
```
```
nix-collect-garbage -d
```
### 4. Profit

