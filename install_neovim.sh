#brew install neovim --HEAD

# install packer.nvim
#git clone https://github.com/wbthomason/packer.nvim \
#  ~/.local/share/nvim/site/pack/packer/opt/packer.nvim

# dotfile
mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/neovim/.config/nvim/init.lua $HOME/.config/nvim/init.lua
# lua
ln -sf $(pwd)/neovim/.config/nvim/lua $HOME/.config/nvim/lua



