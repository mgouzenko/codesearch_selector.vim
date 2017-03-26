if g:codesearch_selector_engine == "CSCOPE"
    nnoremap <buffer> <Return> :call cscope#findInteractive(expand('<cword>'))<CR>
elseif g:codesearch_selector_engine == "YCM"
    nnoremap <buffer> <silent> <Return> :YcmCompleter GoTo <cr>
endif
