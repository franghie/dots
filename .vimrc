" *********************************************************
" Vundle
" *********************************************************
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
Plugin 'scrooloose/nerdcommenter'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'benmills/vimux'
Plugin 'Yggdroot/indentLine'
" the plugins above have been tried.
Plugin 'SirVer/ultisnips'
Plugin 'mbrochh/vim-as-a-python-ide'
"..................................
" vim-scripts repos
Plugin 'bash-support.vim'
Plugin 'vcscommand.vim'
Plugin 'ShowPairs'
Plugin 'c.vim'
"..................................
" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"......................................
call vundle#end()
" *********************************************************
" General
" *********************************************************
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

" *********************************************************
" Quickfix
" *********************************************************
nnoremap <leader>fo :copen<CR>
nnoremap <leader>fc :ccl<CR>
nnoremap <leader>fw :cw<CR>
nnoremap <leader>fn :cn<CR>
nnoremap <leader>fnf :cnf<CR>
" *********************************************************
" Ack
" *********************************************************
nmap <leader>vv :Ack <cword><cr>

" *********************************************************
" tagbar
" *********************************************************
let g:tagbar_left = 1
let g:tagbar_width = 30
nmap <C-t> :TagbarToggle<CR>
" *********************************************************
" ctrlp
" *********************************************************
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
nnoremap <leader>cv :CtrlP ~/volt<CR>
" *********************************************************
" colorscheme
" *********************************************************
syntax enable
set background=dark
colorscheme solarized
" *********************************************************
"  bash-support
" *********************************************************
"\sc     case in ... esac                    (n, i)
"\sei    elif then                           (n, i)
"\sf     for in do done                      (n, i, v)
"\sfo    for ((...)) do done                 (n, i, v)
"\si     if then fi                          (n, i, v)
"\sie    if then else fi                     (n, i, v)
"\ss     select in do done                   (n, i, v)
"\su     until do done                       (n, i, v)
"\sw     while do done                       (n, i, v)
"\sfu    function                            (n, i, v)
"\se     echo -e "..."                       (n, i, v)
"\sp     printf "..."                        (n, i, v)
"\sa     array element, ${.[.]}              (n, i, v)
"\saa    array elements (all), ${.[@]}       (n, i, v)
"\sas    array elements (string), ${.[*]}    (n, i, v)
"\ssa    subarray, ${.[@]::}                 (n, i, v)
"\san    no. of array elements, ${#.[@]}     (n, i, v)
"\sai    array indices, ${!.[*]}             (n, i, v)
"\ta     arithmetic tests                    (n, i)
"\tfp    file permission                     (n, i)
"\tft    file types                          (n, i)
"\tfc    file characteristics                (n, i)
"\ts     string comparison                   (n, i)
"\toe    option is enabled                   (n, i)
"\tvs    variables has been set              (n, i)
"\tfd    file descriptor is open             (n, i)
"\tm     string matches regexp               (n, i)
"\
"\pzo    zero or more, ?( |  )                (n, i)
"\pzm    zero or more, *( |  )                (n, i)
"\pom    one or more, +( |  )                 (n, i)
"\peo    exactly one, @( |  )                 (n, i)
"\pae    anything except, !( |  )             (n, i)
"\ppc    POSIX classes                       (n, i)
"\pbr    BASH_REMATCH                        (n, i)

"END
