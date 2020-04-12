function! RunCode()
  let t:path = bufname("%")
  let t:ext = split(t:path, '\.')[-1]
  if (t:ext == 'py')
    return RunPython()
  endif
  if (t:ext == 'js')
    return RunNode()
  endif
endfunction

function! RunPython()
  return VimuxPromptCommand("clear; python3 " . bufname("%"))
endfunction

function! RunNode()
  call VimuxPromptCommand("clear; node " . bufname("%"))
endfunction

