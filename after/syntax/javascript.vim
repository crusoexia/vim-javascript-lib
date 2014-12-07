echo "after javascript is in charge"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

"" Drop fold if it is set but VIM doesn't support it.
let b:javascript_fold='true'
if version < 600    " Don't support the old version
  unlet! b:javascript_fold
endif

"" dollar sign is permittd anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart
syntax keyword jsLibrary        _ underscore
syntax keyword jsLibrary        jQuery $
syntax keyword jsLibrary        Backbone nextgroup=jsBackboneClass

syntax match jsBackboneClass    /\v%(\.)\zs<%(Model|View|Collection|Events|Router)>/

if version >= 508 || !exists("did_javascript_lib_syn_inits")
  if version < 508
    let did_javascript_lib_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink jsLibrary              Constant
  HiLink jsBackboneClass        Type

  delcommand HiLink
endif

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
