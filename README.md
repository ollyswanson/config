

# Deprecated 
Now using Nix and home-manager: [Hem](https://github.com/ollyswanson/hem)

# Configs
If there are ever any problems with cargo run: `set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths`

## Setting up Neovim

After installing Neovim 0.5 we need to set up a plugin manager, `packer` is a tool written in `lua` that can be installed by running 

```sh
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

We can now [set up](https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/) a `lua` lsp in order to make dealing with writing config files easier.~


