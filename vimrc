set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
Plugin 'lyuts/vim-rtags'
"Plugin 'Valloric/YouCompleteMe'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"" Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Plugin 'L9'
"" Git plugin not hosted on GitHub
"" Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"" Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"" Plugin 'ascenator/L9', {'name': 'newL9'}
"
"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
""
""
"" shit ends here

set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set ts=4
set modelines=5
set number
set hlsearch
set modeline
set autowrite
set relativenumber
set expandtab
set laststatus=2
set backspace=indent,eol,start

set statusline=%F         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=col:\ %c
set statusline+=\ line:\
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines

colorscheme peachpuff

if (!empty(maparg('\bug')))
	unmap <Leader>bug
endif

syntax on

filetype on
filetype plugin on

au BufRead,BufNewFile *.lp set filetype=lobl

highlight Pmenu ctermbg=238
highlight LineNr ctermfg=8
highlight CursorLineNr ctermfg=10
highlight Search ctermfg=8
highlight Search ctermbg=15
highlight Special ctermfg=3
highlight Keyword ctermfg=9

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END

" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax .
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" let g:solarized_termcolors=256
let g:NERDTreeWinPos = "right"

let g:clang_auto = 1
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" bindings
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,d :FufFileWithFullCwd<CR>
nmap ,s :FufFile<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>
nmap ,a :FufFileWithFullCwd \*\*\/<CR>
nmap ,g :!rgrep

noremap <Leader>h :set norelativenumber! nonumber!<cr>
" noremap <Leader>b :Bs
noremap <Leader>e :edit<space>
noremap <Leader>w :w<cr>
noremap <Leader>l :ls<cr>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>r :so ~/.vimrc<cr>
noremap <Leader>1 :bp<cr>
noremap <Leader>2 :bn<cr>
noremap <Leader>t :TagbarToggle<cr>
noremap <Leader>m :!clear && make<cr>
noremap <Leader>M :!clear && make -B<cr>

noremap <c-l> :nohls<cr><c-l>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>
inoremap <PageUp> <nop>
inoremap <PageDown> <nop>
noremap <Home> <nop>
noremap <End> <nop>
inoremap <Home> <nop>
inoremap <End> <nop>

" use C highlighting for shaders
au BufRead,BufNewFile *.vp set syntax=c
au BufRead,BufNewFile *.fp set syntax=c
au BufRead,BufNewFile *.ned set syntax=cpp

" use lisp highliting for machine description (GCC)
au BufRead,BufNewFile *.md set syntax=lisp

" extra whitespace highliting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-5.0/lib/libclang.so.1'

let b:clang_user_options = '-std=c++14'
