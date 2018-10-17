set et
set ts=2
set sw=2

aug js_gf_if_not_extension
    au!
    au FileType javascript set includeexpr=substitute(v:fname,'$','.js','')
aug END
