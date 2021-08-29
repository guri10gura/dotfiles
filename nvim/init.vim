
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein settings {{{
" dein$B<+BN$N<+F0%$%s%9%H!<%k(B
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
" $B%W%i%0%$%sFI$_9~$_!u%-%c%C%7%e:n@.(B
let s:toml_dir = expand('~/.config/nvim')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

" $BITB-%W%i%0%$%s$N<+F0%$%s%9%H!<%k(B
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

