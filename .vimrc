" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" mustang
NeoBundle 'croaker/mustang-vim'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'

NeoBundle 'ujihisa/unite-colorscheme'

NeoBundle 'Align'

NeoBundle 'desert256.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

colorscheme desert256

if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

set background=dark

sy on
"encoding
set enc=utf8
set fenc=utf8
set fileencodings=utf8,cp932,euc-jp
if exists('&ambiwidth')
     set ambiwidth=double
endif
"tab
set expandtab
set ts=4
set shiftwidth=4
"
set number
set foldmethod=marker
"set nowrap
set wrap
set hlsearch
set whichwrap=b,s,h,l,<,>,[,]
set laststatus=2
set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']['.&ft.']'}\ %F%=%l,%c%V%8P
filetype on
" zenkaku-space
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /｡｡/
" search
" (noignorecase)
set ignorecase
" (nosmartcase)
set smartcase
 set incsearch
" match highlight clear ESC
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" explorer order
let g:netrw_sort_sequence="[\\/]$,*,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*[\\/]$,\\.\\(mv\\|old\\|cp\\|bak\\|orig\\)[0-9]*$,\\.o$,\\.info$,\\.swp$,\\.obj$ "
"call togglebg#map("")
set t_Co=16
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:Align_xstrlen = 3
set noswapfile
" list
set list
set listchars=tab:>.,trail:-,nbsp:%,extends:>,precedes:<
highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan
highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
autocmd VimEnter,WinEnter * match IdeographicSpace /　/
nnoremap <Space>w :<C-u>write<CR>
" twig
autocmd BufNewFile,BufRead *.twig set filetype=htmldjango
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline
au BufNewFile,BufRead *.less setf less
au BufNewFile,BufRead *.yml setf yaml
autocmd FileType css set shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType less set shiftwidth=2 softtabstop=2 tabstop=2
:nnoremap j gj
:nnoremap k gk

"" syntastic
  let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': ['php'],
    \ 'passive_filetypes': ['html', 'less'] }
  let g:syntastic_enable_signs=1
  let g:syntastic_auto_jump=1
  let g:syntastic_auto_loc_list=2
  " let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
  let g:syntastic_php_checkers=['php', 'phpmd']
  set statusline+=%#warningmsg#
  "set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
