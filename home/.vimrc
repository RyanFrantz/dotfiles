syntax on
set nocompatible           " Force Vim. I think the presence of .vimrc implies this, but be safe.
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
" Color fix from https://github.com/vim/vim/issues/3608
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
set termguicolors

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

" Add '.' support to repeat commands while in visual mode. - Mastering Vim.
vnoremap . :normal . <CR>

" Move visual selection up or down, rather than copy/paste - Mastering Vim.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" remember where we left off while editing
" https://stackoverflow.com/questions/7894330/preserve-last-editing-position-in-vim
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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
    au BufRead *.md set colorcolumn=80
augroup end

" Use the space bar as the leader key
let mapleader = "\<Space>"
" Clear highlighted search results.
nnoremap <Leader>, :nohlsearch<CR>
" Move the cursor to the 80th column. I use this when fixing up markdown files.
nnoremap ,, 80\|
" Highlight trailing whitespace
match ErrorMsg '\s\+$'

" Use Vundle to manage plugins.
" Since we're using fish, call `updatevundle` from the command line to
" install/update plugins.
" set the runtime path to include Vundle and initialize
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
" YCM doesn't work with the OS-provided vim on Macs. Run `brew install vim`.
" YCM support needs to be compiled. Hop into the plugin directory and do so:
" cd $HOME/.vim/bundle/YouCompleteMe && python3 install.py --all
Plugin 'ycm-core/YouCompleteMe'
" auto-pairs acts up in annoying ways that end up creating more work for me.
"Plugin 'jiangmiao/auto-pairs'
" All of your Plugins must be added before the following line
Plugin 'bluz71/vim-nightfly-guicolors'
" After :PluginInstall, run :call mkdp#util#install()
Plugin 'iamcco/markdown-preview.nvim'
call vundle#end()            " required
" NOTE: Run :PluginInstall in a vim session to install/update plugins.

" Allow backspace in insert mode.
set backspace=indent,eol,start
" enable file plugin files
filetype plugin indent on

" Disable YouCompleteMe documentation popups.
" This can be manually triggered with something like the following:
" nmap <leader>D <plug>(YCMHover)
let g:ycm_auto_hover = ""

" Call :MarkdownPreview after entering a markdown buffer.
" The default browser will open at a random port on localhost.
let g:mkdp_auto_start = 1

colorscheme nightfly
