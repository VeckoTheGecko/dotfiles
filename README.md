# Dotfiles for @VeckoTheGecko
Dotfiles are managed by using a git bare repository, as per [this tutorial](https://www.atlassian.com/git/tutorials/dotfiles).

## New machine setup
Clone
```sh
git clone --bare git@github.com:VeckoTheGecko/dotfiles $HOME/.cfg
```

Alias `config` command
```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Checkout dotfiles into `$HOME`
```sh
config checkout
```
(checking out may error out due to existing dotfiles. Delete these and checkout again to discard and overwrite existing dotfiles)

## Potential future work
- [ ] Zsh install with powerlines theme + config (`.p10k.zsh` file?)
- [ ] Automated installation of well used applications (alternatively, just documenting which applications I generally use)
