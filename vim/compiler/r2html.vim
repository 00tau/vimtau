" Vim compiler file
" Language:    R (file type Rmd)
" Maintainer:  Thomas W. D. Möbius
" Last Change: 2013-10-21

"if exists("current_compiler")
"    finish
"endif
let current_compiler = "r2html"

if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif
CompilerSet errorformat&
CompilerSet makeprg="Rscript -e 'library(knitr); knit2html(\"%\")'"

let &l:makeprg ="Rscript -e 'library(knitr); knit2html(\"%\")'"
