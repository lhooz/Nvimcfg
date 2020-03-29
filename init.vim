call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-jedi'

set splitbelow

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'vim-airline/vim-airline'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'sbdchd/neoformat'

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

Plug 'davidhalter/jedi-vim'

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

let g:neomake_python_enabled_makers = ['pylint']

Plug 'morhetz/gruvbox'

set background=dark " use dark mode
" set background=light " uncomment to use light mode

call plug#end()

call neomake#configure#automake('nrwi', 500)

colorscheme gruvbox

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set shiftwidth=4

set softtabstop=4

set expandtab

set relativenumber


