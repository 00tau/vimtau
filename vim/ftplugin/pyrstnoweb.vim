" Moving around
nnoremap <buffer> ]] /\\section<cr>:nohl<cr>
nnoremap <buffer> [[ ?\\section<cr>:nohl<cr>

" Start-stop formula-block
nnoremap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr>\stopformula<esc>O
inoremap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" Start-stop aligned formula-block
nnoremap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula \startalign<cr>\stopalign \stopformula<esc>O
inoremap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula \startalign<cr>\stopalign \stopformula<esc>O

" Make start-stop block out of the previous word
nnoremap <buffer> <LocalLeader>bb ea\start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO
inoremap <buffer> <LocalLeader>bb \start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO

" Itemize
inoremap <buffer> <LocalLeader>en \startitemize<cr><cr>\stopitemize<Up>\item<Space>
inoremap <buffer> <LocalLeader>bu \startbullet<cr><cr>\stopbullet<Up>\item<Space>
inoremap <buffer> <LocalLeader>ii \item<Space>
nnoremap <buffer> <LocalLeader>ii o\item<Space>

" Font switching and emphasising
inoremap <buffer> <LocalLeader>em {\em }<Left>
inoremap <buffer> <LocalLeader>bf {\bf }<Left>
inoremap <buffer> <LocalLeader>sc {\sc }<Left>
inoremap <buffer> <LocalLeader>tt {\ss }<Left>
inoremap <buffer> <LocalLeader>ss {\tt }<Left>

" Stop smart indentation, does not work well with TeX
set autoindent
set nocindent
set nosmartindent

" Enable spell checking
syn spell toplevel
setlocal spell spelllang=en_gb,de
set spell
