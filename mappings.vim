let mapleader="\<space>"
inoremap <c-j><c-k> <esc>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Autosort imports
map <leader>i :Isort<cr>

" Autoformat
noremap <leader>f :Autoformat; call EslintFix()<cr><cr>

" Eslint autofix
noremap <c-I> :call EslintFix()<cr><cr>

" Wrap
inoremap <c-w> <esc>vgq
map <c-w> <esc>vgq

" Select in insert mode
inoremap <c-e> <esc>v$
inoremap <c-i> <esc>v0
inoremap <c-v> <esc>v<Right>

" Run file with pre-established interpreter or compiler in run.vim
map <Leader>x :call RunCode()<cr><cr>:TmuxNavigateDown<cr>

" Run test with pre-established interpreter or compiler in test.vim
map <Leader>t :call RunTest()<cr><cr>

" Run light server live in current directory
map <Leader>l :call RunLiveServer()<cr><cr>

" Run markdown preview on file in buffer
map <Leader>m :MarkdownPreview<cr><cr>

" " Window movements shortcuts
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" tab navigation mappings
map tt :tabnew<space>
" map <c-Right> :tabn<CR>
noremap tn :tabn<CR>
" imap <c-Right> <ESC>:tabn<CR>
" map <c-Left> :tabp<CR>
noremap tp :tabp<CR>
" imap <c-Left> <ESC>:tabp<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
inoremap <c-o> <esc>o

" NERDTree
inoremap <c-space> <c-x><c-f>
" Use <c-space> to trigger completion.
" map <C-b> :NERDTreeToggle<CR>
" map <leader>/ :NERDTreeToggle<CR>
map <leader>/ :NERDTreeTabsToggle<CR>
nmap  <Plug>NERDCommenterToggle
vmap  <Plug>NERDCommenterToggle
" noremap <c-\> 0i'''<space>

" Insert semicolon and comma in then end line
nmap <leader>; A;<esc>
nmap <leader>, A,<esc>

nmap qq :q<cr>
nmap qa :quitall!<cr>
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
nmap <leader>pc :PlugClean<cr>

inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

noremap <c-T> :call OpenTerm()<cr><cr>:TmuxNavigateDown<cr>
