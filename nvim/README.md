# Installation

## Have a recent Neovim installed

Chances are the one with your distro will be quite old.

    neovim -version
    NVIM v0.4.3
    Build type: Release

Download an app-image somewhere in your path; 

    curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x nvim.appimage

Dealing with your OS, setting alternatives, aliases, is up to you.

## Move the init.vim into place and start nvim to finish the installation:

    1. cd ~/.config
    2. ln -s ~/dotfiles/config/nvim .
    3. Start neovim:
        nvim

The plugin manager will install and then install the plugins.
Restart `nvim` for good measure and that's about it.
