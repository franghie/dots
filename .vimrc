set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'Vundlevim/Vundle.vim'
"
"my Plugin here:
"
" original repos on github
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
" the plugins above have been tried.
Plugin 'SirVer/ultisnips'
"..................................
" vim-scripts repos
Plugin 'vcscommand.vim'
Plugin 'ShowPairs'
Plugin 'c.vim'
"..................................
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"......................................
call vundle#end()
"-------------------------BEGIN--------------------------------
"-------------------------General------------------------------
filetype plugin indent on
set noswapfile
set tabstop=4
set shiftwidth=4
set shell=bash
set expandtab

set number
set tw=80
set formatoptions+=t
let mapleader=","
"--------------------------Ctag--------------------------------
set tags+=~/.vim/tags
"--------------------------Quickfix----------------------------
nnoremap <leader>fo :copen<CR>
nnoremap <leader>fc :ccl<CR>
nnoremap <leader>fw :cw<CR>
nnoremap <leader>fn :cn<CR>
nnoremap <leader>fnf :cnf<CR>
"---------------------------Ack ------------------------------
nmap <leader>vv :Ack <cword><cr>

"---------------------------tagbar----------------------------
let g:tagbar_left = 1
let g:tagbar_width = 30
nmap <C-t> :TagbarToggle<CR>
"---------------------------ctrlp-----------------------------
let g:ctrlp_user_command = 'find %s -type f'  
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
function! CwordCtrlP()
    let g:ctrlp_default_input = expand('<cword>')
    CtrlP ~/volt
    let g:ctrlp_default_input = ''
endfunction
command! CwordCtrlP call CwordCtrlP()
nnoremap <leader>co :CwordCtrlP<CR>
nnoremap <leader>cv :CtrlP ~/<CR>
"------------------------------colorscheme--------------------
syntax enable
set background=dark
colorscheme solarized
"--------------------------------------END--------------------
