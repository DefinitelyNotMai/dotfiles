nnoremap <leader>u :UndotreeToggle<CR>

let g:undotree_RelativeTimestamp = 1
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0
let g:undotree_WindowLayout = 2

if has("persistent_undo")
		set undodir=$XDG_DATA_HOME/nvim/undodir
		set undofile
endif
