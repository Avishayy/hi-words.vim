# hi-words.vim
This is a very simple plugin to allow you to highlight different words in vim.

I found it somewhere around the web a while ago, copied it to my vim configuration file and changed it a bit. Eventually I decided to upload it as a plugin.

# Mappings
First highlight toggle - `<leader>1`
... (up to)
Seventh highlight toggle - `<leader>7`

# Installation
Use your preferred installation method, I use plugged:
`Plug 'avishayy/hi-words.vim'`

# Configuration
This is a reaaaally simple plugin, no configuration is supported by default, you can however do this:
```
" Custom Highlight
hi def HiInterestingWord8 guifg=#000000 ctermfg=16 guibg=#111111 ctermbg=222
" Custom Mapping
nmap <silent> <leader>8 :call HiInterestingWord(8)<cr>
```

Note that the highlight definition must be a number prepended by `HiInterestingWord` and that number needs to be passed to `HiInterestingWord()`
