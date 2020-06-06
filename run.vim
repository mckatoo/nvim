function! RunCode()
  let t:path = bufname("%")
  let t:ext = split(t:path, '\.')[-1]
  if (t:ext == 'py')
    return RunPython()
  endif
  if t:ext=='js' || t:ext=='json'
    return RunNode()
  endif
endfunction

" ===================================

function! RunPython()
  call VimuxCloseRunner()
  return VimuxRunCommand("clear; python3 " . bufname("%"))
endfunction

function! RunNode()
  call VimuxCloseRunner()
  call VimuxRunCommand("npm run dev")
endfunction

function! RunLiveServer()
  call VimuxRunCommand("light-server -s . -w '**/*.js, **/*.html' -o")
endfunction

function! OpenTerm()
  call VimuxPromptCommand("clear")
endfunction
