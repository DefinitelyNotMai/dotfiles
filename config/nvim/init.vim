source ~/.config/nvim/basic-settings.vim
source ~/.config/nvim/plugconfig/indentline.vim
source ~/.config/nvim/plugconfig/easy-motion.vim
source ~/.config/nvim/plugconfig/undotree.vim
source ~/.config/nvim/plugconfig/table-mode.vim
source ~/.config/nvim/plugconfig/goyo.vim
source ~/.config/nvim/plugconfig/git-gutter.vim
source ~/.config/nvim/plugconfig/vim-airline.vim
source ~/.config/nvim/plugconfig/vim-hexokinase.vim
source ~/.config/nvim/plugconfig/fern.vim
source ~/.config/nvim/plugconfig/vim-closetag.vim

call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'gruvbox-community/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'lambdalisue/fern.vim'
Plug 'alvan/vim-closetag'
call plug#end()

colorscheme gruvbox
