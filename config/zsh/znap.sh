#!/usr/bin/env zsh

[[ -r ~/.znap/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/znap
source ~/.znap/znap/znap.zsh  # Start Znap

znap source hlissner/zsh-autopair
znap source zsh-users/zsh-syntax-highlighting
znap install zsh-users/zsh-completions
znap source Aloxaf/fzf-tab
znap source zsh-users/zsh-autosuggestions

# eval "$(fzf --zsh)"
