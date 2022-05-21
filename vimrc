" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set nu
set expandtab
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

hi search guibg=LightBlue

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
 syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
"set helpfile=$VIMRUNTIME/doc/help.txt.gz

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on
 " when we copy multi-line code , we should execute "filetype plugin on", and reopen file to copy
endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
  au BufRead reportbug-*		set ft=mail
augroup END


" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set dictionary=.c-c++-keywords.list
set ls=2
set hls
set sw=4
set ts=4
filetype plugin indent on
autocmd BufReadPost * if line("'\"") | exe "normal '\"" | endif
"set sm
"set bg=dark


let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:alternateExtensions_CPP = "inc,h,H,HPP,hpp"


"start configure for bufferlist.vim
map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 25
"end of configure for bufferlist.vim


"start configure for PreviewTag.vim
command! -nargs=? -complete=tag_listfiles       PreviewTag call PreviewTag(<f-args>)
map <F12> :PreviewTag<CR>
"end of configure for PreviewTag.vim

"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\ 
"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()} 
"set rulerformat=%15(%c%V\ %p%%%) 
"set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()} 

fu! FileTime() 
        let ext=tolower(expand("%:e")) 
        let fname=tolower(expand('%<')) 
        let filename=fname . '.' . ext 
        let msg="" 
        let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename)) 
        return msg 
endf 

fu! CurTime() 
        let ftime="" 
        let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S") 
        return ftime 
endf
highlight Search term=standout ctermfg=0 ctermbg=3
hi Comment ctermfg=6
