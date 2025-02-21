# dotfiles

tutorial: https://home.codevoid.de/posts/2019-04-27_Manage_dotfiles_with_git.html or https://www.reddit.com/r/unixporn/comments/1bbi7qr/comment/kuaelf7/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button or or https://www.atlassian.com/git/tutorials/dotfiles

Clone
```sh
git clone --bare git@github.com:VeckoTheGecko/dotfiles $HOME/.dotfiles
```

Alias `config` command (already in bashrc/zshrc)
```sh
alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Checkout dotfiles into `$HOME`
```sh
config checkout
```
(checking out may error out due to existing dotfiles. Delete these and checkout again to discard and overwrite existing dotfiles)

## TODO
- [ ] Record brew casks (`brew bundle dump`)
- [ ] Add NixOS conf

