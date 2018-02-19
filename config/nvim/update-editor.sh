#!/bin/sh
# calls update-alternatives to set certain system default choices because 
# friends don't let friends use nano.
sudo update-alternatives --set editor /usr/bin/nvim

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 10
sudo update-alternatives --config editor

sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 10
sudo update-alternatives --config vim


sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 10
sudo update-alternatives --config vi

sudo update-alternatives --install /usr/bin/vim.basic vim.basic /usr/bin/nvim 10
sudo update-alternatives --config vim.basic
