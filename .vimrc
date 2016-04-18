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
Plugin 'rdnetto/YCM-Generator'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
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
"------------------------------------------ctag-------------------------------------------------
set tags+=~/.vim/tags
"-------------------------------- Quickfix-----------------------------------------------------
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :ccl<CR>
nnoremap <leader>qw :cw<CR>
nnoremap <leader>qn :cn<CR>
nnoremap <leader>qnf :cnf<CR>
"---------------------------------Ack --------------------------------------------------------
nmap <leader>aa :Ack <cword><cr>

"------------------------------------------tagbar---------------------------------------------
let g:tagbar_left = 1
let g:tagbar_width = 30
nmap <C-t> :TagbarToggle<CR>
"------------------------------------------ctrlp------------------------------------------
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
"------------------------------------------colorscheme------------------------------------------
syntax enable
set background=dark
colorscheme solarized
"-----------------------------------------------YouCompleteMe--------------------------------
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>        "force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>        "open locationlist
" nnoremap <leader>lc :lclose<CR>       "close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'
"--------------------YCM END---------------------------
