" Vim compiler file
" Language:    ConTeXt (file type context)
" Maintainer:  Thomas W. D. Möbius
" Last Change: 2013-10-21

"if exists("current_compiler")
"    finish
"endif
let current_compiler = "context"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet errorformat&
CompilerSet makeprg="context"

let &l:makeprg = "context --batchmode"

" let s:cpo_save = &cpo
" set cpo-=C
"
" CompilerSet errorformat=
"       \%E%>%f:%l:\ %m,
"       \%Cl.%l\ %m,
"       \%+C\ \ %m.,
"       \%+C%.%#-%.%#,
"       \%+C%.%#[]%.%#,
"       \%+C[]%.%#,
"       \%+C%.%#%[{}\\]%.%#,
"       \%+C<%.%#>%.%#,
"       \%GOutput\ written\ on\ %m,
"       \%GTeXExec\ \|\ run%m
"
" let &cpo = s:cpo_save
" unlet s:cpo_save
