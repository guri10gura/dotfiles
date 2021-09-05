
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls

filetype plugin on

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" dein settings {{{
" インストール Dein
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
" 設定ファイルを読み込み
let s:toml_dir = expand('~/.config/nvim')
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/deinlazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインをインストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" Setting Key mapping
nnoremap qqq: <Esc>q:
nnoremap qqq/ <Esc>q/
nnoremap qqq? <Esc>q?

" Disable key ( q:, q/, q? )
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>

" Change directory that file opend
nnoremap <silent> <Space>cd :cd %:h<CR>


nnoremap <silent> <Space>cp :CopyPath<CR>
nnoremap <silent> <Space>cf :CopyFile<CR>

" move to center, when input parenthesis
inoremap {}<Space> {}<LEFT>
inoremap []<Space> []<LEFT>
inoremap ()<Space> ()<LEFT>
inoremap ""<Space> ""<LEFT>
inoremap ''<Space> ''<LEFT>
inoremap ``<Space> ``<LEFT>
inoremap <><Space> <><LEFT>

" move cursor when it's insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap {}<Space><CR> {<CR>}<UP><CR>

" move separator
nnoremap <C-l> <C-w>><CR><UP>
nnoremap <C-h> <C-w><<CR><UP>
nnoremap <C-j> <C-w>-<CR><UP>
nnoremap <C-k> <C-w>+<CR><UP>

" ESCの連打で検索結果ハイライトをリセット
nnoremap <ESC><ESC> :nohlsearch<CR>

vnoremap <silent> <C-p> "0p
