#!/bin/sh
# make various links for NeoVim and more
# See: https://github.com/solutionroute/dotfiles

# possibly already in place:
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim/.
# set up plugin module for THIS USER ONLY, note path
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# LAST STEP
echo "The last step in setting up Neovim is to run :PlugInstall - let's do that now"
read -p "Press any key to continue..."
nvim -c PlugUpdate -c PlugInstall -c quitall
echo "Finished. Check out Neovim with nvim or vim"
