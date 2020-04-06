 " Plugins
call plug#begin()
Plug 'prettier/vim-prettier'
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
Plug 'l04m33/vlime'
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
call plug#end()

" Initial commands
filetype plugin on

colorscheme gruvbox
set nobackup nowritebackup
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set background=dark
set hidden
set number
set relativenumber
set inccommand=split
set autoindent
set splitright
set termguicolors
set mouse=a
confirm

autocmd FileType vim let b:vcm_tab_complete = 'vim'
autocmd FileType js let b:vcm_tab_complete = 'javascript'

" open NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:tmuxcomplete#asyncomplete_source_options = {
      \ 'name':      'tmuxcomplete',
      \ 'whitelist': ['*'],
      \ 'config': {
      \     'splitmode':      'words',
      \     'filter_prefix':   1,
      \     'show_incomplete': 1,
      \     'sort_candidates': 0,
      \     'scrollback':      0,
      \     'truncate':        0
      \     }
      \ }
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDir = '~/.config/nvim/UltiSnippets'
let g:python3_host_prog = '/usr/bin/python3'
let g:NERDTreeGitStatusWithFlags = 1
"leit g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
"\ "Staged"    : "#0ee375",  
"\ "Modified"  : "#d9bf91",  
"\ "Renamed"   : "#51C9FC",  
"\ "Untracked" : "#FCE77C",  
"\ "Unmerged"  : "#FC51E6",  
"\ "Dirty"     : "#FFBD61",  
"\ "Clean"     : "#87939A",   
"\ "Ignored"   : "#808080"   
"\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

" prettier command for coc
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Mappings

let mapleader="\<space>"

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" NERDTree 
" inoremap <c-j><c-k> <ESC>
map <c-j><c-k> <ESC>
inoremap <c-space> <c-x><c-f>
" Use <c-space> to trigger completion.
nmap <leader>b :NERDTreeToggle<CR>
" vmap <c-/> <plug>NERDCommenterToggle
" nmap <c-/> <plug>NERDCommenterToggle
" imap <c-/> <plug>NERDCommenterToggle
map <leader>/ <space>ci

nmap <leader>; A;<esc>
nmap qq :q<cr>
nmap qa :quitall<cr>
nmap ss :w<cr>
nmap <leader>w <c-w><c-w>
nmap <leader>s :w<space>
nmap <leader>v :vsplit<cr>
nmap <leader>h :split<cr>
nmap V :vsplit<space>
nmap H :split<space>

nmap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nmap <leader>sv :source ~/.config/nvim/init.vim<cr>
nmap <leader>et :vsplit ~/.tmux.conf<cr>
nmap <leader>st :source-file ~/.tmux.conf<cr>
nmap <s-f> :let @/="<C-r><C-w>"<CR> 
nmap <leader>pi :PlugInstall<cr>
nmap <leader>pu :PlugUpdate<cr>

" Functions
