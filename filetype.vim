if exists('did_load_filetypes')
    finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile  /tmp/*/fex_tree::*  set filetype=fex_tree
augroup END
