" ============================================================================
" Initial commands
" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

autocmd FileType vim let b:vcm_tab_complete = 'vim'
autocmd FileType py let b:vcm_tab_complete = 'python'
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
autocmd BufNewFile,BufRead *.js set syntax=javascript ft=javascript
autocmd BufNewFile,BufRead *.cjs set syntax=javascript ft=javascript
autocmd BufNewFile,BufRead *.mjs set syntax=javascript ft=javascript

set wrap
set encoding=utf-8
set termguicolors
set background=dark
colorscheme NeoSolarized
set nobackup nowritebackup
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set hidden
set number
set relativenumber
set inccommand=split
set autoindent
set splitright
set termguicolors
set mouse=a
set noswapfile
set conceallevel=0
confirm

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" needed so deoplete can auto select the first suggestion
set completeopt+=noinsert
" comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" disabled by default because preview makes the window flicker
set completeopt-=preview

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" fix problems with uncommon shells (fish, xonsh) and plugins running commands
" (neomake, ...)
" set shell=/bin/bash
set shell=/bin/zsh

" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>

" save as sudo
ca w!! w !sudo tee "%"

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

let g:nerdtree_tabs_open_on_console_startup=2
let g:nerdtree_tabs_smart_startup_focus=2
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_meaningful_tab_names=1
let g:nerdtree_tabs_autoclose=1
let g:nerdtree_tabs_synchronize_view=1
let g:nerdtree_tabs_synchronize_focus=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_startup_cd=1
let g:nerdtree_tabs_autofind=0
let g:NERDTreeWinSize=40
let g:Tlist_WinWidth=40
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" show hidden files
let NERDTreeShowHidden=1
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")
  endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" Neomake ------------------------------

" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

" Deoplete -----------------------------

" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
call deoplete#custom#option({
      \ 'auto_complete_delay': 200,
      \ 'smart_case': v:true,
      \ 'enable_at_startup': v:true,
      \ })
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

" Jedi-vim ------------------------------

" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

" Ack.vim ------------------------------

" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

let g:yankring_history_dir = '~/.config/nvim/'
" Fix for yankring and neovim problem when system has non-text things
" copied in clipboard
let g:yankring_clipboard_monitor = 0

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" open NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Others configurations
let g:pymode_lint_signs = 1

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
set runtimepath+=~/.config/nvim/plugged/vim-snippets
let g:UltiSnipsEditSplit = 'vertical'
" let g:UltiSnipsSnippetDir = '~/.config/nvim/UltiSnippets'
let g:UltiSnipsSnippetDirectories = [
      \ $HOME.'/.config/nvim/UltiSnips',
      \ $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips'
      \]
" let g:UltiSnipsSnippetDirectories = [
      " \ $HOME.'/.config/nvim/UltiSnips',
      " \ $HOME.'/.config/nvim/UltiSnippets',
      " \ $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips'
      " \]
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-i>"
" let g:UltiSnipsJumpBackwardTrigger="<c-u>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:python3_host_prog = '/usr/bin/python3'
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
      \ "Staged"    : "#0ee375",
      \ "Modified"  : "#d9bf91",
      \ "Renamed"   : "#51C9FC",
      \ "Untracked" : "#FCE77C",
      \ "Unmerged"  : "#FC51E6",
      \ "Dirty"     : "#FFBD61",
      \ "Clean"     : "#87939A",
      \ "Ignored"   : "#808080"
      \ }

let g:NERDTreeIgnore = ['^node_modules$']

let g:NERDSpaceDelims = 1

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat_require_pragma = 0

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Slimv split size
let g:slimv_repl_split_size = 10

