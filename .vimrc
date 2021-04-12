set tabstop=2 shiftwidth=2 expandtab ai
set cursorline                 " Highlight the current line
set history=5000               " Increase command line history
set hlsearch                   " Enable search highlighting
set ignorecase                 " Ignore case in search patterns
set smartcase                  " Use case if any caps used 
set incsearch                  " Highlight search pattern as it is being typed
set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters
set listchars+=nbsp:_          " ┘
set report=0                   " Report the number of lines changed
set directory=~/.vim/swaps     " Set directory for swap files
set undodir=~/.vim/undos       " Set directory for undo files
set undofile                   " Automatically save undo history
set wildmenu     
set scrolloff=2                " When scrolling, keep the cursor
                               " 2 lines below the top and 2 lines
                               " above the bottom of the screen
set nocompatible               " Don't make vim vi-compatibile
syntax on                      " Enable syntax highlighting
set autoindent                 " Copy indent to the new line
" Load up all of our plugins
color desert
set paste
set norelativenumber 
set nonumber
set textwidth=79
set softtabstop=2
set encoding=utf-8
if filereadable(expand("~/.vimrc.bundles"))
   source ~/.vimrc.bundles
endif
set ruler                      " Enable ruler
set laststatus=2               " Enable status
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c        " Customize the status line
