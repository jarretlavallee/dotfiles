" Fri Jan 20 15:56:46 PST 2017
:syntax on
:set background=dark


:if &term == "xterm"
:  set t_kb=
:  fixdel
:  set backspace=2 " allow backspace beyond insertion point
:  set ic                  " ignore case on search
:  set laststatus=2        " always show status line
: set undolevels=1000     " large undo history
:endif
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set softtabstop=2



" Custom keybindings
:map <F4> <Esc>!}fmt<CR>
:map <F2> <Esc>:setlocal spell spelllang=en_us<CR>
:map <F3> <Esc>:setlocal nospell<CR>
" V runs ispell
"map V :w^M:!ispell -x %^M:e!^M^M
au BufRead,BufNewFile *.json set filetype=json
au! Syntax json source $HOME/.vim/plugins/json.vim
cmap w!! w !sudo tee % >/dev/null

highlight comment ctermfg=cyan

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>
" Enable indentation matching for =>'s
filetype plugin indent on

" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {
        \ "!level":  "errors",
        \ "type":    "syntax" }
