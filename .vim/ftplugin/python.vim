setlocal autoindent
setlocal expandtab
setlocal shiftwidth=4
setlocal smarttab
setlocal tabstop=4

" Show lines that are 80 characters or longer
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>100v.\+/
