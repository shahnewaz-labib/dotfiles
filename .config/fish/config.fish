if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias fn="echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode"
alias rdshift="redshift -l 24.1:90.41 & disown"
alias update='sudo pacman -Syu'

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias nvimcfg='nvim ~/.config/nvim/init.vim'
alias g='git'
alias l='ls -l'

pfetch

set fish_greeting
