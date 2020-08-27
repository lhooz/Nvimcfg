call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-jedi'

set splitbelow splitright

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Plug 'vim-airline/vim-airline'

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mengelbrecht/lightline-bufferline'

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name',
            \   'filename': 'LightlineFilename',
            \ },
            \ 'tabline': {
            \   'left': [ ['buffers'] ],
            \   'right': [ ['close'] ]
            \ },
            \ 'component_expand': {
            \   'buffers': 'lightline#bufferline#buffers'
            \ },
            \ 'component_type': {
            \   'buffers': 'tabsel'
            \ }
            \ }

function! LightlineFilename()
    let root = fnamemodify(get(b:, 'gitbranch_path'), ':h:h')
    let path = expand('%:p')
    if path[:len(root)-1] ==# root
        return path[len(root)+1:]
    endif
    return expand('%')
endfunction

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':t'

set showtabline=2

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

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

Plug 'lervag/vimtex'

let g:tex_flavor = 'latex'

call plug#end()

call neomake#configure#automake('nrwi', 500)

call deoplete#custom#var('omni', 'input_patterns', {
            \ 'tex': g:vimtex#re#deoplete
            \})

colorscheme gruvbox

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set shiftwidth=4

set softtabstop=4

set expandtab

set relativenumber

tnoremap <Esc> <C-\><C-n>
