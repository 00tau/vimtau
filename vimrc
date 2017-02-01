set nocompatible
set encoding=utf-8
scriptencoding utf-8

set guioptions=a

"------------------------------------
" pathogen
"------------------------------------
runtime bundle/pathogen/autoload/pathogen.vim
"let g:pathogen_disabled = ['']
call pathogen#infect()

"------------------------------------
" Eye candy
"------------------------------------
set t_Co=256
syntax enable

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid
"highlight clear SignColumn
"highlight link SignColumn LineNr

set cursorline
set number
set showmode
set showcmd
set title
set showmatch

"------------------------------------
" Spell check settings
"------------------------------------
set spelllang=en_gb,de
set spellsuggest=9

au FileType text,tex,context,markdown set spell

"------------------------------------
" File type handling
"------------------------------------
filetype plugin on
filetype indent on
set fileformat=unix

au FileType text,tex,context,markdown set nosmartindent

"------------------------------------
" Behaviour
"------------------------------------
set directory=~/.tmp
set backupdir=~/.tmp
set undodir=~/.tmp
set undolevels=1000
set undoreload=1000
set undofile
set history=50
set showcmd
set hidden
set autoread
set joinspaces

if has('mouse')
  set mouse=a
endif

if has("vms")
  set nobackup
else
  set backup
endif

if has("autocmd")
  " resume at last cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " Automatically change local directory (lch) to current file in buffer but
  " not when the file lies in /tmp
  autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
endif

"------------------------------------
" Indentation
"------------------------------------
set textwidth=72
set wrap linebreak wrapmargin=0 nolist
set tabstop=4
set backspace=2
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set comments+=b:#'

"------------------------------------
" Search
"------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set gdefault
set wrapscan

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Convenient command to see the difference between the current buffer
" and the file it was loaded from, thus the changes you made. Only
" define it, when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"----------------------------------------
" Deal with unwanted spaces
"----------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

"---------------------------------------
" Turn off the annoying beeb
"---------------------------------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"---------------------------------------
" Set leader / localleader
"---------------------------------------
let maplocalleader = "\\"

"------------------------------------
" Send lines of code to tmux
"------------------------------------
nmap <C-c>r <Plug>SetTmuxVars

" Send current line to tmux
au FileType sh,zsh,markdown,python,pyrstnoweb nnoremap <buffer> <space> yy:call SendToTmux(@")<cr>j

" Send current paragraph or selection to tmux
au FileType sh,zsh,markdown vnoremap <buffer> <cr> y:call SendToTmux(@")<cr>
au FileType sh,zsh,markdown nnoremap <buffer> <cr> yap:call SendToTmux(@")<cr>

" Send current paragraph or selection to tmux (running ipython) and execute
au FileType python,pyrstnoweb vmap <buffer> <cr> "+y:call SendToTmux('%paste')<cr>}<space>
au FileType python,pyrstnoweb nmap <buffer> <cr> "+yap:call SendToTmux('%paste')<cr>}<space>

"------------------------------------
" Statusbar
"------------------------------------
set statusline=%<\ %f\ %{fugitive#statusline()}\ %=type=%Y\ pos=%04l,%04v\ %p%%\ len=%L
set laststatus=2

hi statusline guibg=#c5c8c6 guifg=#2d3c46 ctermbg=15 ctermfg=0

"---------------------------------------
" NERDTree
"---------------------------------------
let g:NERDTreeHijackNetrw=0
let NERDTreeIgnore = ['\.log$', '\.tuc$', '\.pdf$', '\.html$', '\.rdat$', '\.aux', '\.bbl', '\.blg', '\.tuc']

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"---------------------------------------
" Cntr-P
"---------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*/pkg/*,*.so,*.swp,*.zip,*.pdf,*.aux,*.bbl,*.blg,*.tuc,*.log

"------------------------------------
" Markdown
"------------------------------------
au BufRead,BufNewFile *.md :set ft=markdown | :set spell
au BufRead,BufNewFile README :set ft=markdown | :set spell
au FileType markdown :hi link markdownError Normal
au FileType markdown :syn match markdownIgnore "\$.*_.*\$"

let g:vim_markdown_folding_disabled=1

"------------------------------------
" Pandoc
"------------------------------------
let g:pandoc_no_empty_implicits = 1
let g:pandoc_no_folding = 1
let g:vimrplugin_pandoc_args = "--toc"

"------------------------------------
" Mutt
"------------------------------------
" set up syntax highlighting for e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail | :set spell

"------------------------------------
" Python
"------------------------------------
au BufRead,BufNewFile *.py :set ft=python
au FileType python set tw=72

"------------------------------------
" R-plugin
"------------------------------------
let g:vimrplugin_nosingler = 0
let g:vimrplugin_tmux = 1
let g:Rout_more_colors = 1
let g:vimrplugin_underscore = 0
let g:vimrplugin_indent_commented = 1
let g:vimrplugin_notmuxconf = 1
let g:vimrplugin_screenplugin = 0
let g:vimrplugin_assign = 0
let g:vimrplugin_term = "st"
let g:vimrplugin_vimpager = "vertical"

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

au FileType rmd :compiler r2html
au FileType rmd abbreviate eueu ```{r}<cr>```<C-o>O<C-o>D
au FileType rmd abbreviate euey ```<cr><cr>```{r}<C-o>O<C-o>D

au FileType r,rdoc,rmd map <buffer> <space> <LocalLeader>lj
au FileType r,rdoc,rmd map <buffer> <cr> <LocalLeader>cd

au FileType rmd nnoremap <buffer> ]] /^#<cr>
au FileType rmd nnoremap <buffer> [[ ?^#<cr>

"------------------------------------
" ConTeXt / LaTeX / TeX
"------------------------------------
let g:tex_flavor = "context"

au FileType tex,context,latex inoremap <c-f> <right><space>
au FileType tex,context,latex inoremap <c-b> <c-h>~$$<left>

"------------------------------------
" Haskell / Literate Haskell
"------------------------------------
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"
let hs_highlight_delimiters = 1 " highlight delimiter characters
let hs_highlight_boolean = 1    " treat True and False as keywords
let hs_highlight_types = 1      " treat names of primitive types as keywords
let hs_allow_hash_operator = 1  " highlight # as operators instead

"---------------------------------------
" Custom Keys
"---------------------------------------
let g:swap_custom_ops = ['~']

" Unbind some keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Del>', '<BS>']
    exe prefix . "noremap " . key . " <nop>"
  endfor
endfor

for prefix in ['n', 'v']
  for key in ['+', '-', 'h', 'l']
    exe prefix . "noremap " . key . " <nop>"
  endfor
endfor

" Toggle NerdTree
noremap l :NERDTreeToggle<cr>

" Commit and stage in Git
noremap <C-g> :Gstatus<cr>

" Navigate buffers
noremap <left> :sbn<bar>bd#<cr>
noremap <up> :bp<cr>
noremap <down> :bn<cr>
noremap <right> :b#<cr>

" Quick movements within a line
noremap h F
noremap t f
noremap H T
noremap T t
noremap , ;
noremap ; ,

" Quick movements to marks
noremap M `

" Move to the last character of a paragraph (f), or do the same and
" enter insert mode and add a space, too (F).  This is particular useful
" when writing prose (TeX, etc.).
noremap f }k$
nmap F fa<space>

" Nice movement with wrapped lines
noremap j gj
noremap k gk

" Format current paragaph
nnoremap <C-space> gwip

" Undo highlighting
noremap <C-cr> :nohl<cr>
