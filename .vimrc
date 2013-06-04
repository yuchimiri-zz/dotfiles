set nocompatible
filetype off

set rtp+=~/.vim/vundle/
call vundle#rc()
call pathogen#infect()

Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

" color
highlight LineNr ctermfg=darkyellow
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey
highlight DiffAdd cterm=bold ctermbg=green
highlight StatusLine ctermbg=white
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4
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
filetype indent on
filetype plugin on
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
autocmd BufNewFile,BufRead *.twig setfiletype htmldjango
"if &term =~ "xterm-256color"
"    colorscheme desert256
"endif
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
colorschem solarized
set noswapfile
" list
set list
set listchars=tab:>.,trail:-,nbsp:%,extends:>,precedes:<
highlight SpecialKey term=underline ctermfg=darkcyan guifg=darkcyan
highlight IdeographicSpace term=underline ctermbg=LightCyan guibg=LightCyan
autocmd VimEnter,WinEnter * match IdeographicSpace /　/
nnoremap <Space>w :<C-u>write<CR>
" twig
autocmd BufNewFile,BufRead *.twig setfiletype htmldjango
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
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
