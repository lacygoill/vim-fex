if exists('b:did_ftplugin')
    finish
endif

" Mappings {{{1

nno  <buffer><nowait><silent>  (  :<c-u>call search('.*/$', 'b')<cr>
nno  <buffer><nowait><silent>  )  :<c-u>call search('.*/$')<cr>

nno  <buffer><nowait><silent>  -m  :<c-u>call fex#print_metadata('manual')<cr>
xno  <buffer><nowait><silent>  -m  :<c-u>call fex#print_metadata('manual', 'vis')<cr>
nno  <buffer><nowait><silent>  -M  :<c-u>call fex#print_metadata('auto')<cr>

nno  <buffer><nowait><silent>  <c-w>F   :<c-u>call fex#tree#edit('split')<cr>
nno  <buffer><nowait><silent>  <c-w>f   :<c-u>call fex#tree#edit('split')<cr>
nno  <buffer><nowait><silent>  <c-w>gf  :<c-u>call fex#tree#edit('tab')<cr>

nno  <buffer><nowait><silent>  ?   :<c-u>call fex#tree#display_help()<cr>
nno  <buffer><nowait><silent>  R   :<c-u>call fex#tree#reload()<cr>
nno  <buffer><nowait><silent>  gh  :<c-u>call fex#tree#toggle_dot_entries()<cr>

nno  <buffer><nowait><silent>  h  :<c-u>call fex#tree#relative_dir('parent')<cr>
nno  <buffer><nowait><silent>  l  :<c-u>call fex#tree#relative_dir('child')<cr>
nno  <buffer><nowait><silent>  p  :<c-u>call fex#tree#preview()<cr>
nno  <buffer><nowait><silent>  q  :<c-u>call fex#tree#close()<cr>

nno  <buffer><nowait><silent>  {  k:call fex#tree#preview()<cr>
nno  <buffer><nowait><silent>  }  j:call fex#tree#preview()<cr>

" Options {{{1

setl bh=delete bt=nofile nobl noswf nowrap

augroup fex_tree
    au! * <buffer>
    au BufWinEnter <buffer> setl cocu=nc cole=3
    \                            fde=fex#tree#fde() fdm=expr fdt=fex#tree#fdt()
    \                     | call fex#tree#fdl()
augroup END


" Variables {{{1

let b:did_ftplugin = 1

" teardown {{{1

let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
    \ . (empty(get(b:, 'undo_ftplugin', '')) ? '' : '|')
    \ . 'setl bh< bl< bt< cocu< cole< fde< fdl< fdm< fdt< swf< wrap<'
    \ . '| unlet! b:fex_curdir'
    \ . '| exe "au! fex_tree * <buffer>"'
    \
    \ . '| nunmap <buffer> -M'
    \ . '| nunmap <buffer> -m'
    \ . '| xunmap <buffer> -m'
    \
    \ . '| nunmap <buffer> ('
    \ . '| nunmap <buffer> )'
    \ . '| nunmap <buffer> <c-w>F'
    \ . '| nunmap <buffer> <c-w>f'
    \ . '| nunmap <buffer> <c-w>gf'
    \ . '| nunmap <buffer> ?'
    \ . '| nunmap <buffer> R'
    \ . '| nunmap <buffer> gh'
    \ . '| nunmap <buffer> h'
    \ . '| nunmap <buffer> l'
    \ . '| nunmap <buffer> p'
    \ . '| nunmap <buffer> q'
    \ . '| nunmap <buffer> {'
    \ . '| nunmap <buffer> }'

