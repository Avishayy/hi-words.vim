" An arbitrary match ID
let s:id_base = 1337331

hi def HiInterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def HiInterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def HiInterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def HiInterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def HiInterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def HiInterestingWord6 guifg=#000000 ctermfg=16 guibg=#f0254b ctermbg=95
hi def HiInterestingWord7 guifg=#000000 ctermfg=16 guibg=#654321 ctermbg=123

function! ClearInterestingWords()
    let i = 1
    while i <= 7
        let mid = s:id_base + i
        silent! call matchdelete(mid)
        let i += 1
    endwhile
    return
endfunction

function! HiInterestingWord(n)

    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    let mid = s:id_base + a:n

    try 
        " If we deleted the match, it means that we toggled it off!
        call matchdelete(mid)
    catch 'E803'
        " No match was found to delete, so construct it!

        " Construct a literal pattern that has to match at boundaries.
        let pat = '\V\<' . escape(@z, '\') . '\>'

        " Actually match the words.
        call matchadd('HiInterestingWord' . a:n, pat, 1, mid)
    endtry

    " Move back to our original location.
    normal! `z
endfunction

" Clear all highlights
nmap <silent> <leader>0 :call ClearInterestingWords()<cr>

" Default Highlights
nmap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nmap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nmap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nmap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nmap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nmap <silent> <leader>6 :call HiInterestingWord(6)<cr>
nmap <silent> <leader>7 :call HiInterestingWord(7)<cr>
