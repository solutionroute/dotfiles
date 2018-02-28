#!/bin/sh
# make various links for NeoVim and more
# See: https://github.com/solutionroute/dotfiles

# XSession 
# Only running dwm; no need for Xresources
# ln -s ~/dotfiles/.Xresources ~/.
ln -s ~/dotfiles/.xsessionrc ~/.

# possibly already in place:
mkdir -p ~/.config/nvim
# putting spellfiles, temp files, history etc in ~/.vim 
mkdir -p ~/.vim/temp
ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim/.
ln -s ~/dotfiles/config/nvim/init.vim ~/.vimrc
# set up plugin module for THIS USER ONLY, note path
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# dpireset - used because I switch between HiDPI laptop and desktop monitors
mkdir ~/bin
cd ~/bin
ln -s ~/dotfiles/scripts/dpireset.sh
ln -s ~/dotfiles/scripts/terminal.sh

# LAST STEP
echo "The last step in setting up Neovim is to run :PlugInstall - let's do that now"
read -p "Press any key to continue..."
nvim -c PlugUpdate -c PlugInstall -c quitall
echo "Finished. Check out Neovim with nvim or vim"
