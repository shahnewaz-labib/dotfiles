if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias update='sudo pacman -Syu'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nvimcfg='nvim ~/.config/nvim/init.vim'

