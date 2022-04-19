autocmd FileType typescript.tsx setlocal commentstring={/*\ %s\ */}
autocmd BufNewFile,BufRead *.tsx,*jsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript
