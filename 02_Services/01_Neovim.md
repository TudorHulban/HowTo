# Neovim: Installation and Configuration

## Installation

```sh
sudo apt-get install neovim
```

Get binary version with `nvim --version`.

### Python support

```bash
sudo apt-get install python-neovim
sudo apt-get install python3-neovim
```

### Installation Resources

```html
https://github.com/neovim/neovim/wiki/Installing-Neovim
```

## Check health

```bash
:checkhealth
```

## Create user settings folders and files

```bash
mkdir -p ~/.config/nvim/autoload
touch ~/.config/nvim/init.vim
```

## Plugin install

Git needed as dependency (sudo apt install git).<br/>
If any issues with plugin install consider deleting plugin folder and reinstall.

```bash
cd ~/.config/nvim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Use :PlugInstall and :PlugStatus to install and check on plugins. 

## Minimal Configuration

Tested on Debian.

```bash
" Basic Settings "
syntax on
set cursorline
set number relativenumber
set colorcolumn=130
set title
set foldlevel=0
colo industry

" Set plugin configuration "
let g:VIM_PLUG_PATH = expand(stdpath('config') . '/autoload/plug.vim')
let g:PLUGIN_HOME = expand(stdpath('config') . '/plugins')

" Load Plugins "
call plug#begin(g:PLUGIN_HOME)
Plug 'vim-airline/vim-airline'

" Set Airline theme "
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='codedark'

" Nerdtree – Tree File Explorer "
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
Plug 'scrooloose/nerdTree'

" Development "
Plug 'itchyny/vim-highlighturl'

call plug#end()
```

## Improved visuals

### Standard color schemes

Standard color schemes coming with Neovim reside in `/usr/share/nvim/runtime/colors`.  
Can use `bblue` dark theme in this folder.

### Additional Schemes

Add before plugin end Airline color schemes. Themes in `..../vim-airline-themes/autoload/airline/themes`.

Violet theme:

```bash
" Airline (powerline) "
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
```

Dark theme:

```bash
" Airline (powerline) "
let g:airline_theme='codedark'
```

## General additions

### Tree File Explorer

Adding Ctrl+e shortcut.  
Toggle panel with `Ctrl+w` or `Ctrl+w+h/l` for navigation.

```bash
" Nerdtree – Tree File Explorer "
nmap <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
Plug 'scrooloose/nerdTree'
```

### Resources

```html
https://github.com/preservim/nerdtree
https://stackoverflow.com/questions/4446062/two-basic-questions-with-nerdtree-switching-windows-and-finding-files
https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
```

### Icons for File Explorer

Dependency: Nerd Font  

```sh
" Icons – Tree File Explorer "
Plug 'ryanoasis/vim-devicons'
```

#### Nerd Font installation

Download `Hack` font from https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack.<br/>
Place downloads in `./local/share/fonts`, example of files to download:

- Hack Regular Nerd Font Complete.ttf
- Hack Italic Nerd Font Complete.ttf
- Hack Bold Italic Nerd Font Complete.ttf
- Hack Bold Nerd Font Complete.ttf

### URL Highlighter

```bash
" URL Highlighter "
Plug 'itchyny/vim-highlighturl'
```

## Additions for Golang

## Additions for Javascript

### Emmet

Switch completion based on configured key.

```bash
" Emmet "
let g:user_emmet_expandabbr_key = ',,'
Plug 'mattn/emmet-vim'
```

#### Test

Open new file and type:

```sh
html:5
```

Exit insert mode and press Ctrl+y+comma.

#### Emmet Resources

```html
https://www.youtube.com/watch?v=ha7oyvhgP04
```

### Prettier

Dependency: npm.  
Simple install:

```bash
" Prettier "
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
```

With selection of file types:

```bash
" Prettier "
let g:prettier#config#parser = 'babylon'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
```

#### Prettier Resources

```html
https://github.com/prettier/vim-prettier
```
## Plugin configuration for Peppermint OS

```bash
" Set plugin configuration "
let g:VIM_PLUG_PATH =  './autoload/plug.vim'  
let g:PLUGIN_HOME =  './nvim' 
```

## Configuration under review

```bash
  call plug#begin(g:PLUGIN_HOME)
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale'

  call plug#end()
  
  " ALE Section "
  " Fix files automatically on save "
  let g:ale_fix_on_save = 1
  let g:ale_completion_enabled = 1
  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['eslint'], }
  let g:ale_sign_column_always = 1
```

## Vim Resources

```bash
https://vimawesome.com/
https://devtechnica.com/vim-neovim/best-neovim-plugins-for-software-development-in-2019
https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
http://learnvimscriptthehardway.stevelosh.com/
```
