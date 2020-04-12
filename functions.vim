" Move to the window in the direction shown, or create a new window
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" ====================================================
" Compile or Run file
let custom_run_path = "~/.config/nvim/run.vim"
if filereadable(expand(custom_run_path))
  execute "source " . custom_run_path
endif

