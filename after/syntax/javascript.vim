" Vim syntax file
" This is a [vim-javascript](https://github.com/pangloss/vim-javascript)'s companion, 
" which is used for highlight the javascript library keywords.
"
" Language:     JavaScript
" Maintainer:   crusoexia
" URL:          https://github.com/crusoexia/vim-javascript-lib

syntax match    jsPropertyAccessExpr  /\.\<[a-zA-Z_$][0-9a-zA-Z_$]*\>/ contains=jsArrayMethods

" Native: {{{
syntax keyword  jsArrayMethods        length from isArray observe of concat copyWithin entries every fill filter find findIndex forEach includes indexOf join keys lastIndexOf map pop push reduce reduceRight reverse shift slice some sort splice toLocaleString toSource toString unshift values contained
" }}}

" 3rd party libraries: {{{
syntax keyword  jsLibrary             _ underscore lodash
syntax keyword  jsLibrary             jQuery Zepto $
syntax keyword  jsLibrary             Backbone nextgroup=jsBBoneAccessExpr
syntax keyword  jsLibrary             angular
syntax keyword  jsLibrary             Handlebars Mustache
syntax keyword  jsLibrary             jasmine
syntax keyword  jsLibrary             Q
syntax keyword  jsLibrary             sinon

syntax match    jsBBoneAccessExpr     /\./ contained nextgroup=jsBackboneClass
syntax keyword  jsBackboneClass       Model View Collection Events Router History contained

syntax match    jsJQDelimiter         /\v<\$/
" }}}

" Module: {{{
syntax keyword  jsInclude             require
syntax keyword  jsDefine              define exports module
syntax cluster  jsModule              contains=jsInclude,jsDefine
" }}}

" Testing: {{{
syntax keyword  jsTesting             describe it test before after beforeEach afterEach beforeAll afterAll expect
" }}}

" Add to [vim-javascript](https://gi  thub.com/pangloss/vim-javascript) syntax groups.
syntax cluster  jsExpression          add=jsLibrary,jsJQDelimiter,@jsModule,jsTesting,@jsNativeMethods,jsPropertyAccessExpr

if version >= 508 || !exists("did_javascript_lib_syn_inits")
  if version < 508
    let did_javascript_lib_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink  jsLibrary             Constant
  HiLink  jsBackboneClass       Constant
  HiLink  jsJQDelimiter         Delimiter
  HiLink  jsInclude             Include
  HiLink  jsDefine              Define
  HiLink  jsTesting             Statement
  HiLink  jsArrayMethods        Special

  delcommand HiLink
endif
