syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set ruler
set incsearch
set vb
set expandtab
set smarttab
set smartindent
set autoread                " re-read files automatically if they are changed
set laststatus=2            " always show the status bar
set ruler                   " ruler isn't a bad thing
set showmatch               " bracket matching
set showmode                " show current mode
set scrolloff=999           " keep cursor in the middle
set hlsearch                " enable highlighted search
set ignorecase              " ignore case when searching

" ---------------------------------------------------------
" color config
" ---------------------------------------------------------
"set t_Co=256                " Use 256 terminal palette.
set cursorline               " Highlight the current line.
colorscheme delek

" Status line
set statusline=%<%F\ \|                     " File name, truncated if need be.
set statusline+=\ Col:\ %c\ \|              " Column number.
set statusline+=\ %l/%L\ lines\ [%P]        " Percentage through the file.

" Lifted from http://cromwell-intl.com/linux/vim-word-count.html
let g:word_count="<unknown>" " Give us a moment to count the words.
function WordCount()
    return g:word_count
endfunction

function UpdateWordCount()
    let lnum = 1
    let n = 0
    while lnum <= line('$')
        let n = n + len(split(getline(lnum)))
        let lnum = lnum + 1
    endwhile
    let g:word_count = n
endfunction

" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
    au! CursorHold,CursorHoldI * call UpdateWordCount()
    " Add word count to the status line when we're editing Markdown files.
    au BufRead *.md set statusline+=\ \|\ Word\ count:\ %{WordCount()}
augroup END
" End lift from http://cromwell-intl.com/linux/vim-word-count.html

" Comments should be inline with my current indent.
inoremap # X#

" remember where we left off while editing
set viminfo='20,\"50

" enable file plugin files
filetype plugin indent on

" Open new files with some useful boilerplate.
augroup c_files
    au BufNewFile *.c 0r ~/.vim/skeleton/c.skel
augroup end

augroup perl_files
    au BufNewFile *.pl 0r ~/.vim/skeleton/perl.skel
augroup end

" Teach vim to recognize Markdown files.
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

augroup blog_posts
    au BufNewFile ~/git/southpaw/_posts/*.md 0r ~/.vim/skeleton/blog_post.skel
augroup end

" Enable Pathogen to manage my vim plugins
execute pathogen#infect()
