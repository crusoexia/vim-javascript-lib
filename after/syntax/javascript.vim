" Vim syntax file
" This is a [vim-javascript](https://github.com/pangloss/vim-javascript)'s companion, 
" which is used for highlight the javascript library keywords.
"
" Language:     JavaScript
" Maintainer:   crusoexia
" URL:          https://github.com/crusoexia/vim-javascript-lib

" 3rd party libraries: {{{
syntax keyword  jsLibrary           _ underscore
syntax keyword  jsLibrary           jQuery Zepto $
syntax keyword  jsLibrary           Backbone nextgroup=jsBBoneAccessExpr
syntax keyword  jsLibrary           angular
syntax keyword  jsLibrary           Handlebars Mustache
syntax keyword  jsLibrary           jasmine

syntax match    jsBBoneAccessExpr   /\./ contained nextgroup=jsBackboneClass
syntax keyword  jsBackboneClass     Model View Collection Events Router History contained

syntax match    jsJQDelimiter       /\v<\$/
" }}}

" Standards and community: {{{
syntax keyword  jsAMDFunction       define require
" }}}

" Add to [vim-javascript](https://github.com/pangloss/vim-javascript) syntax groups.
syntax cluster  jsExpression        add=jsLibrary,jsJQDelimiter,jsAMDFunction

if version >= 508 || !exists("did_javascript_lib_syn_inits")
  if version < 508
    let did_javascript_lib_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jsLibrary              Constant
  HiLink jsBackboneClass        Constant
  HiLink jsJQDelimiter          Delimiter
  HiLink jsAMDFunction          Special

  delcommand HiLink
endif
