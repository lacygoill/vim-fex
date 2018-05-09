let b:current_syntax = 'tree'

" Syntax {{{1

syn  match  treeOnlyLastComponent               '─\s\zs.*/\%(.\{-}[^/]\)\@='             conceal
syn  match  treeOnlyLastComponentBeforeWarning  '─\s\zs.*/\ze.\{-}/\%(\s\[.\{-}\]\)\@='  conceal

syn  match  treeDirectory   '\%(─\s.*/\)\@<=[^/]*/$'
syn  match  treeExecutable  '[^/]*\*$'

syn  match  treeLinkPrefix  '─\s\zs/.*/\ze[^/]*\s->\s'  conceal
syn  match  treeLink        '[^/]*\s->\s'
"                            ├───┘
"                            └ last path component of a symlink:
"
"                                      /proc/11201/exe -> /usr/lib/firefox/firefox*
"                                                  ^^^^^^^

syn  match  treeLinkFile        '\%(\s->\s\)\@<=.*[^*/]$'
syn  match  treeLinkDirectory   '\%(\s->\s\)\@<=.*/$'
syn  match  treeLinkExecutable  '\%(\s->\s\)\@<=.*\*$'

syn  match  treeWarning    '[^/]*/\=\ze\s\[.\{-}\]'
syn  match  treeHelp       '^"\s.*' contains=treeHelpKey,treeHelpTitle,treeHelpCmd
syn  match  treeHelpKey    '^"\s\zs\S\+\%(\s\S\+\)\=' contained
"                                            │
"                                            └ `f` in `C-w f`
syn  match  treeHelpTitle  '===.*===' contained
syn  match  treeHelpCmd    '^"\s$\stree.*' contained

" Colors {{{1

hi link  treeWarning         WarningMsg
hi link  treeHelp            Comment
hi link  treeHelpKey         Function
hi link  treeHelpTitle       Type
hi link  treeHelpCmd         WarningMsg

hi link  treeDirectory       Directory
hi       treeExecutable      ctermfg=darkgreen guifg=darkgreen

hi       treeLink            ctermfg=darkmagenta guifg=darkmagenta
hi link  treeLinkFile        Normal
hi link  treeLinkDirectory   Directory
hi       treeLinkExecutable  ctermfg=darkgreen guifg=darkgreen
