" ============================================================================
" Plugins
let custom_plugins_path = "~/.config/nvim/plugins.vim"
if filereadable(expand(custom_plugins_path))
  execute "source " . custom_plugins_path
endif

" ============================================================================
" Initial commands
let custom_initial_path = "~/.config/nvim/initial.vim"
if filereadable(expand(custom_initial_path))
  execute "source " . custom_initial_path
endif

" ============================================================================
" Mappings
let custom_mappings_path = "~/.config/nvim/mappings.vim"
if filereadable(expand(custom_mappings_path))
  execute "source " . custom_mappings_path
endif

" ============================================================================
" Functions
let custom_functions_path = "~/.config/nvim/functions.vim"
if filereadable(expand(custom_functions_path))
  execute "source " . custom_functions_path
endif

