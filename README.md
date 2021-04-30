
# Neomoji

Did you ever want to fuzzy find emoji on NeoVim? Well, I did and that's why I created Neomoji. Neomoji is a NeoVim pluggin that leverages [Telescope](https://github.com/nvim-telescope/telescope.nvim) to provide a fuzzy finder for emojis.

## Getting started

Get this pluggin with you plugin manager of choice. Beware, you will need [NeoVim nightly (V0.5)](https://github.com/neovim/neovim/releases/tag/nightly) and [Telescope](https://github.com/nvim-telescope/telescope.nvim) (along with its dependencies).

Using [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'javier-varez/neomoji.nvim'
```

Using [packer](https://github.com/wbthomason/packer.nvim):

```
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use 'nvim-telescope/telescope.nvim'
use 'javier-varez/neomoji.nvim'
```

## Usage

Call the `:Neomoji` command or map it to a key combination:

```
nnoremap <leader>fe <cmd>Neomoji<CR>
inoremap <A-e> <cmd>Neomoji<CR>
```

You can also call `require('neomoji').find()` from Lua code directly.

