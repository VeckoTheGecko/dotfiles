alias config='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
eval "$(starship init zsh)"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Hodgs004/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Hodgs004/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/Hodgs004/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Hodgs004/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

