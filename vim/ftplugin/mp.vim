nnoremap <buffer> <space> :w<cr>:silent make %:r.pdf<cr>:silent ! xdotool search --class mupdf key --window \%\@ r<cr>
