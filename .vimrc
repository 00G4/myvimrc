"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show number on side, and turn on syntax highlighting so I don't kill myself
set number relativenumber
set cursorline
set autoread
set autoindent
set shiftwidth=4
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set scrolloff=8
set nu
set signcolumn=yes
"set colorcolumn=80
syntax on

"this is cursor configuration, top insert mode cursor, bottom for normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

"Plugins Begin
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'yggdroot/indentline'
Plug 'sainnhe/everforest'
Plug 'mattn/emmet-vim'
Plug 'townk/vim-autoclose'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'NLKNguyen/papercolor-theme'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production' }

call plug#end()
"Plugins End

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Airline Theme
"let g:airline_theme= 'solarized'
let g:airline_theme= 'dark'
"let g:airline_solarized_bg= 'dark'
let g:airline_powerline_fonts = 1

"NERDTree plugin toggle
nmap <C-n> :NERDTreeToggle<CR>

"vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,
                \ *.graphql,*.md,*.vue,*.svelte,*.yaml,*.PrettierAsync

"color
set background=dark
colorscheme papercolor
"colorscheme gruvbox

"set background transparent
hi Normal guibg=NONE ctermbg=NONE

"background transparency toggle
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
   endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>
