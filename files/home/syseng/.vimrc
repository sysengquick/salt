set visualbell
syntax on
filetype plugin indent on
au FileType * set fo-=c fo-=r fo-=o
au BufRead,BufNewFile *.sls set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
