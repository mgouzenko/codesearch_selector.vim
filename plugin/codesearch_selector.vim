" Set the default codesearch engine to be YCM
let g:codesearch_selector_engine = "YCM"

"  Gets the directory where the file in the current window lives. If there's
"  no file, just return cwd.
function s:windowdir()
  if winbufnr(0) == -1
    let unislash = getcwd()
else
    let unislash = fnamemodify(bufname(winbufnr(0)), ':p:h')
  endif
    return tr(unislash, '\', '/')
endfunc

function s:find_cscope_db(file_name,start_dir,stop_dir)
    let cur_dir = a:start_dir
    while ( strlen( cur_dir ) > 0  )
        if filereadable( cur_dir . "/" . a:file_name  )
            let g:codesearch_selector_engine = "CSCOPE"
        endif
        let fr = match(cur_dir, "/[^/]*$")
        if fr == -1
            break
        endif
        let cur_dir = strpart(cur_dir, 0, fr)
        if cur_dir == a:stop_dir
            break
        endif
    endwhile
endfunc

call s:find_cscope_db("cscope.out",s:windowdir(),$HOME)
