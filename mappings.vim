let mapleader="\<space>"
inoremap <c-j><c-k> <esc>

" Run Python file with python3
" map <Leader>x :call VimuxPromptCommand("clear; python3 " . bufname("%"))<cr><cr>:TmuxNavigateDown<cr>
map <Leader>x :call RunCode()<cr><cr>:TmuxNavigateDown<cr>

" Window movements shortcuts
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" tab navigation mappings
map tt :tabnew 
map <c-Right> :tabn<CR>
imap <c-Right> <ESC>:tabn<CR>
map <c-Left> :tabp<CR>
imap <c-Left> <ESC>:tabp<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
inoremap <c-o> <esc>o

" NERDTree 
inoremap <c-space> <c-x><c-f>
" Use <c-space> to trigger completion.
map <C-b> :NERDTreeToggle<CR>
nmap  <Plug>NERDCommenterToggle
vmap  <Plug>NERDCommenterToggle

nmap <leader>; A;<esc>
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

inoremap <c-h> <Left>
inoremap <c-j> <Down>
inoremap <c-k> <Up>
inoremap <c-l> <Right>

