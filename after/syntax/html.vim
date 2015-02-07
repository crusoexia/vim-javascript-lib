" Vim syntax file
" Fix the default html attribute highlight.
"
" Language:     HTML
" Maintainer:   crusoexia
" URL:          https://github.com/crusoexia/vim-javascript-lib

setlocal iskeyword+=-
syntax match htmlArg        /\v<\w%(\w|\-)*>/ contained
