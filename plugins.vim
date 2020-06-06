" ============================================================================
" Vim-plug initialization

let fancy_symbols_enabled = 0
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" ============================================================================

" Plugins
call plug#begin("~/.config/nvim/plugged")
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mxw/vim-jsx'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'skywind3000/asyncrun.vim'
Plug 'benmills/vimux'
Plug 'vim-scripts/IndexedSearch'
Plug 'majutsushi/tagbar'
Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'kris2k/vim-pathogen'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'ajh17/vimcompletesme'
Plug 'stephpy/vim-yaml'
Plug 'pearofducks/ansible-vim'
Plug 'chase/vim-ansible-yaml'
Plug 'docker/docker'
Plug 'ekalinin/dockerfile.vim'
Plug 'pld-linux/vim-syntax-vcl'
Plug 'vivien/vim-linux-coding-style'
Plug 'pangloss/vim-javascript'
Plug 'myhere/vim-nodejs-complete'
Plug 'kovisoft/slimv'
Plug 'altercation/vim-colors-solarized'
Plug 'icymind/neosolarized'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fisadev/FixedTaskList.vim'
if vim_plug_just_installed
    Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'Shougo/context_filetype.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'mileszs/ack.vim'
Plug 'lilydjwg/colorizer'
Plug 't9md/vim-choosewin'
Plug 'fisadev/vim-isort'
Plug 'valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'neomake/neomake'
Plug 'myusuf3/numbers.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thaerkh/vim-indentguides'
Plug 'chiel92/vim-autoformat'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'pantharshit00/vim-prisma'
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
