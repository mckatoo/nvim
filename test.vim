function! RunTest()
  try
    let t:path = bufname("%")
  catch /.*/
    echo "Caught error: " . v:exception
  finally
    let t:ext = split(t:path, '\.')[-1]
    if (t:ext == 'py')
      return TestPython()
    endif
    if (t:ext == 'js' || filereadable("package.json"))
      return TestNode()
    endif
  endtry
endfunction

" ===================================

function! TestPython()
  return VimuxPromptCommand("clear; python3 test")
endfunction

function! TestNode()
  call VimuxPromptCommand("clear; npm test")
endfunction

